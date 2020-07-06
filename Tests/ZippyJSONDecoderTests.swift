//Copyright (c) 2018 Michael Eisel. All rights reserved.

import XCTest
@testable import ZippyJSON
import ZippyJSONCFamily

struct TestCodingKey: CodingKey {
    var stringValue: String

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    var intValue: Int? {
        return nil
    }

    init?(intValue: Int) {
        return nil
    }
}

extension DecodingError: Equatable {
    public static func == (lhs: DecodingError, rhs: DecodingError) -> Bool {
        switch lhs {
        case .typeMismatch(let lType, let lContext):
            if case let DecodingError.typeMismatch(rType, rContext) = rhs {
                return /*lType == rType && */rContext == lContext
            }
        case .valueNotFound(let lType, let lContext):
            if case let DecodingError.valueNotFound(rType, rContext) = rhs {
                return /*lType == rType && */rContext == lContext
            }
        case .keyNotFound(let lKey, let lContext):
            if case let DecodingError.keyNotFound(rKey, rContext) = rhs {
                return keysEqual(lKey, rKey) && rContext == lContext
            }
        case .dataCorrupted(let lContext):
            if case let DecodingError.dataCorrupted(rContext) = rhs {
                return rContext == lContext
            }
        @unknown default:
            return false
        }
        return false
    }
}

extension JSONKey: Equatable {
    public static func == (lhs: JSONKey, rhs: JSONKey) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
}

func aKeysEqual(_ lhs: [CodingKey], _ rhs: [CodingKey]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    return zip(lhs, rhs).map { (l, r) -> Bool in
        return l.stringValue == r.stringValue || (l.intValue != nil && l.intValue == r.intValue)
    }.reduce(true) { $0 && $1 }
}

func keysEqual(_ lhs: CodingKey, _ rhs: CodingKey) -> Bool {
    return lhs.stringValue == rhs.stringValue || (lhs.intValue != nil && lhs.intValue == rhs.intValue)
}

public func testRoundTrip<T: Codable & Equatable>(_ object: T) {
    let data: Data = try! JSONEncoder().encode(object)
    let json = String(data: data, encoding: .utf8)!
    testRoundTrip(of: T.self, json: json)
}

func threadTime() -> CFTimeInterval {
    var tp: timespec = timespec()
    if #available(macOS 10.12, *) {
        clock_gettime(CLOCK_THREAD_CPUTIME_ID, &tp)
    } else {
        abort()
    }
    return Double(tp.tv_sec) + Double(tp.tv_nsec) / 1e9;
}

func time(_ closure: () -> ()) -> CFTimeInterval {
    let start = threadTime()
    //let _: Int = autoreleasepool {
        closure()
        //return 0
    //}
    let end = threadTime()
    return end - start
}

func averageTime(_ closure: () -> ()) -> CFTimeInterval {
    let count = 10
    var times: [CFTimeInterval] = []
    for _ in 0..<count {
        times.append(time(closure))
    }
    return times.dropFirst(count / 3).reduce(0, +) / CFTimeInterval(times.count)
}

func testPerf<T: Decodable>(appleDecoder: JSONDecoder, zippyDecoder: ZippyJSONDecoder, json: Data, type: T.Type) {
    let zippyTime = averageTime {
        let _ = try! zippyDecoder.decode(type, from: json)
    }
    let appleTime = averageTime {
        let _ = try! appleDecoder.decode(type, from: json)
    }
    XCTAssert(zippyTime < appleTime / 3)
}

public func testRoundTrip<T>(of value: T.Type,
                              json: String,
                              outputFormatting: JSONEncoder.OutputFormatting = [],
                              dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
                              dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy = .deferredToDate,
                              dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
                              dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy = .base64,
                              keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
                              keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                              nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
                              nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy = .throw,
                              testPerformance: Bool = false) where T : Decodable, T : Equatable {
    do {
        
        let d = JSONDecoder()
        d.dateDecodingStrategy = ZippyJSONDecoder.convertDateDecodingStrategy(dateDecodingStrategy)
        d.dataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
        d.nonConformingFloatDecodingStrategy = ZippyJSONDecoder.convertNonConformingFloatDecodingStrategy(nonConformingFloatDecodingStrategy)
        d.keyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
        let apple = try d.decode(T.self, from: json.data(using: .utf8)!)
        
        let decoder = ZippyJSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        let decoded = try decoder.decode(T.self, from: json.data(using: .utf8)!)
        
        XCTAssertEqual(decoded, apple)
        if decoded == apple && testPerformance {
            testPerf(appleDecoder: d, zippyDecoder: decoder, json: json.data(using: .utf8)!, type: T.self)
        }
    } catch {
        XCTFail("Failed to decode \(T.self) from JSON: \(error)")
    }
}

extension JSONKey {
    fileprivate static func create(_ values: [StringOrInt]) -> [JSONKey] {
        return values.map {
            if let i = $0 as? Int {
                return JSONKey(intValue: i)!
            }
            return JSONKey(stringValue: $0 as! String)!
        }
    }
}

protocol StringOrInt {
}

extension String: StringOrInt {}

extension Int: StringOrInt {}

extension CodingKey {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.stringValue == rhs.stringValue && lhs.intValue == rhs.intValue
    }
}

func pathsEqual(_ lPath: [CodingKey], _ rPath: [CodingKey]) -> Bool {
    return lPath.count == rPath.count && zip(lPath, rPath).allSatisfy { (a, b) in
        keysEqual(a, b)
    }
}

extension DecodingError.Context: Equatable {
    public static func == (lhs: DecodingError.Context, rhs: DecodingError.Context) -> Bool {
        let lPath = lhs.codingPath//.drop { $0.stringValue == "" && $0.intValue == nil }
        let rPath = rhs.codingPath//.drop { $0.stringValue == "" && $0.intValue == nil }
        let pathsEqual = lPath.count == rPath.count && zip(lPath, rPath).allSatisfy { (a, b) in
            keysEqual(a, b)
        }
        return pathsEqual// && lhs.debugDescription == rhs.debugDescription
    }
}

class ZippyJSONTests: XCTestCase {
    let decoder = ZippyJSONDecoder()
    lazy var base64Data = {
        return dataFromFile("base64.json")
    }()
    lazy var twitterData = {
        dataFromFile("twitter.json")
    }()
    lazy var canadaData = {
        self.dataFromFile("canada.json")
    }()

    func dataFromFile(_ file: String) -> Data {
        let path = Bundle(for: type(of: self)).path(forResource: file, ofType: "")!
        let string = try! String(contentsOfFile: path)
        return string.data(using: .utf8)!
    }
    
	func testExceptionSafetyAroundObjectPool() {
		// https://github.com/michaeleisel/ZippyJSON/issues/20
		struct Aa: Equatable & Decodable {
			let value: String
			enum Keys: String, CodingKey {
				case value
			}
			init(from decoder: Decoder) throws {
				let outer = try decoder.container(keyedBy: Keys.self)
				try autoreleasepool {
    				let _ = try decoder.container(keyedBy: JSONKey.self)
				}
				if let _ = try? outer.decode(Bb.self, forKey: .value) {
					XCTFail()
					value = ""
				} else if let _ = try? outer.decode(Bb.self, forKey: .value) {
					XCTFail()
					value = ""
				} else {
					value = try outer.decode(String.self, forKey: .value)
				}
			}
		}
		
		struct Bb: Equatable & Decodable {
			let placeholder: String
			init(from decoder: Decoder) throws {
				let _ = try decoder.container(keyedBy: JSONKey.self)
				placeholder = "bar"
			}
		}
		testRoundTrip(of: Aa.self, json: #"{"value": "foo"}"#)
	}

    func testData() {
        //let error = DecodingError.dataCorrupted(DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Encountered Data is not valid Base64."))
        _testFailure(of: [Data].self, json: #"["😊"]"#)
    }
    
    func testVeryNestedArray() {
        testRoundTrip(of: [[[[[Int]]]]].self, json: #"[[[[[2]]]]]"#)
    }

    func assertEqualsApple<T: Codable & Equatable>(data: Data, type: T.Type) {
        let testDecoder = ZippyJSONDecoder()
        let appleDecoder = JSONDecoder()
        let testObject = try! testDecoder.decode(type, from: data)
        let appleObject = try! appleDecoder.decode(type, from: data)
        XCTAssertEqual(appleObject, testObject)
    }
    
    func testNestedDecode() {
        struct Aa: Equatable & Codable {
            let a: [Int]
            let b: [Int]
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                var nestedContainer = try container.nestedUnkeyedContainer()
                self.a = [try nestedContainer.decode(Int.self)]
                self.b = [try container.decode(Int.self)]
            }
        }
        testRoundTrip(of: Aa.self, json: #"[[2], 3]"#)

        struct Bb: Equatable & Codable {
            let a: Int
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: JSONKey.self)
                let nestedContainer = try container.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "value")!)
                self.a = try nestedContainer.decode(Int.self, forKey: JSONKey(stringValue: "inner")!)
            }
        }
        testRoundTrip(of: Bb.self, json: #"{"value": {"inner": 4}}"#)
    }
    
    func testJSONKey() {
        XCTAssertEqual(JSONKey(intValue: 1), JSONKey(stringValue: "1", intValue: 1))
    }
    
    func testCodingPath() {
        struct Aa: Equatable & Codable {
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: JSONKey.self)
                XCTAssert(container.allKeys.count == 0)
                //XCTAssertEqual(container.codingPath.count, 0)
            }
        }
        testRoundTrip(of: Aa.self, json: "{}")
        
        struct Cc: Equatable & Codable {
            init(from decoder: Decoder) throws {
                for _ in 0..<3 {
                    let container = try decoder.container(keyedBy: JSONKey.self)
                    let inner = try container.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "inner")!)
                    XCTAssert(aKeysEqual(container.allKeys, [JSONKey(stringValue: "inner")!]))
                    let path = [JSONKey(stringValue: "inner")!]
                    let testPath = inner.codingPath
                    XCTAssert(aKeysEqual(testPath, path))
                }
            }
        }
        testRoundTrip(of: Cc.self, json: #"{"inner": {"a": 2}}"#)
        
        struct Bb: Equatable & Codable {
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                let _ = try container.nestedUnkeyedContainer()
            }
        }
        //_testFailure(of: Bb.self, json: "[]")
    }

    func testMoreCodingPath() {
        struct Dd: Equatable & Codable {
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: JSONKey.self)
                let emptyDict = try container.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "emptyDict")!)
                let emptyArray = try container.nestedUnkeyedContainer(forKey: JSONKey(stringValue: "emptyArray")!)
                XCTAssert(aKeysEqual(emptyDict.codingPath, JSONKey.create(["emptyDict"])))
                // XCTAssert(aKeysEqual(emptyArray.codingPath, JSONKey.create(["emptyArray"])))
                //XCTAssert(aKeysEqual(decoder.codingPath, []))
            }
        }
        testRoundTrip(of: Dd.self, json: #"{"emptyDict": {}, "emptyArray": [], "dict": {"emptyNestedDict": {}, "emptyNestedArray": []}}"#)
    }
    
    func testArrayDecodeNil() {
        struct Aa: Equatable & Codable {
            let a: [Int?]
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                let _ = try container.decodeNil()
                self.a = [try container.decode(Int.self)]
            }
        }
        
        testRoundTrip(of: Aa.self, json: #"[1, 2]"#)
    }
    
    struct Example: Equatable, Codable {
        let key: String

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.key = (try? container.decode(String.self, forKey: .key)) ?? ""
        }
    }

    struct Example2: Equatable, Codable {
        let key: String

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let double = try? container.decode(Double.self, forKey: .key) {
                self.key = "\(double)"
            } else {
                self.key = try container.decode(String.self, forKey: .key)
            }
        }
    }
    
    func testStuff() {
        struct Aa: Decodable, Equatable {
            let a: [String: String]
        }
        testRoundTrip(of: Aa.self, json: #"{"a": {}}"#)
        _testFailure(of: Aa.self, json: #"{"a": 2}"#)
    }
    
    func testNilAdvance() {
        struct Aa: Codable & Equatable {
            let a: Int
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                while try container.decodeNil() {
                }
                a = try container.decode(Int.self)
            }
        }
        testRoundTrip(of: Aa.self, json: #"[2]"#)
        testRoundTrip(of: Aa.self, json: #"[null, 2]"#)
        testRoundTrip(of: Aa.self, json: #"[null, null, 2]"#)
        _testFailure(of: Aa.self, json: #"[]"#)
        _testFailure(of: Aa.self, json: #"[null]"#)
    }
    
    func testURLError() {
        _testFailure(of: [URL].self, json: #"[""]"#)
    }

    func testOptionalInvalidValue() {
        testRoundTrip(of: Example.self, json: "{\"key\": 123}")
        testRoundTrip(of: Example2.self, json: "{\"key\": 123}")
        testRoundTrip(of: Example2.self, json: "{\"key\": \"123\"}")
    }

    func testRecursiveDecoding() {
        decoder.keyDecodingStrategy = .custom({ (keys) -> CodingKey in
            let recursiveDecoder = ZippyJSONDecoder()
            let data: Data = keys.last!.stringValue.data(using: .utf8)!
            return TestCodingKey(stringValue: try! recursiveDecoder.decode(String.self, from: data))!
        })
    }
    
    func dateError(_ msg: String) -> DecodingError {
        let path = [JSONKey(index: 0)]
        let context = DecodingError.Context(codingPath: path, debugDescription: msg)
        return DecodingError.dataCorrupted(context)
    }
    
    func testSuperDecoder() {
        struct Aa: Equatable, Codable {
            let a: Int
            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                let superDecoder = try container.superDecoder()
                let superContainer = try superDecoder.singleValueContainer()
                self.a = try superContainer.decode(Int.self)
            }
        }

        testRoundTrip(of: Aa.self, json: "[2]")

        struct Bb: Equatable, Codable {
            let a: Int
            init(from decoder: Decoder) throws {
                var container = try decoder.container(keyedBy: JSONKey.self)
                let superDecoder = try container.superDecoder()
                var superContainer = try superDecoder.unkeyedContainer()
                self.a = try superContainer.decode(Int.self)
            }
        }
        
        testRoundTrip(of: Bb.self, json: #"{"super": [2]}"#)
        
        struct Cc: Equatable, Codable {
            let a: Int
            init(from decoder: Decoder) throws {
                var container = try decoder.container(keyedBy: JSONKey.self)
                let superDecoder = try container.superDecoder(forKey: JSONKey(stringValue: "foo")!)
                var superContainer = try superDecoder.unkeyedContainer()
                self.a = try superContainer.decode(Int.self)
            }
        }

        testRoundTrip(of: Cc.self, json: #"{"foo": [2]}"#)
    }
    
    func testOther() {
        struct Aa: Codable & Equatable {
            let a: Int
        }
        _testFailure(of: Aa.self, json: #"{}"#)
        struct Bb: Codable & Equatable {
            let a: Int
            init(from decoder: Decoder) throws {
                let c1 = try decoder.container(keyedBy: JSONKey.self)
                let c2 = try c1.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "a")!)
                let c3 = try c2.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "b")!)
                let c4 = try c3.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "c")!)
                a = try c4.decode(Int.self, forKey: JSONKey(stringValue: "d")!)
            }
        }
        testRoundTrip(of: Bb.self, json: #"{"a": {"b": {"c": {"d": 2}}}}"#)
        _testFailure(of: Bb.self, json: #"{"a": {"b": {"c": {"d": false}}}}"#, relaxedErrorCheck: true)
        struct Cc: Codable & Equatable {
            let a: Int
            init(from decoder: Decoder) throws {
                let c1 = try decoder.container(keyedBy: JSONKey.self)
                let c2 = try c1.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "a")!)
                let c3 = try c2.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "b")!)
                let c4 = try c3.nestedContainer(keyedBy: JSONKey.self, forKey: JSONKey(stringValue: "c")!)
                var c5 = try c4.nestedUnkeyedContainer(forKey: JSONKey(stringValue: "d")!)
                let c6 = try c5.nestedContainer(keyedBy: JSONKey.self)
                var c7 = try c6.nestedUnkeyedContainer(forKey: JSONKey(stringValue: "e")!)
                a = try c7.decode(Int.self)
            }
        }
        testRoundTrip(of: Cc.self, json: #"{"a": {"b": {"c": {"d": [{"e": [2]}]}}}}"#)
        _testFailure(of: Cc.self, json: #"{"a": {"b": {"c": {"d": [{"e": [false]}]}}}}"#, relaxedErrorCheck: true)
        /*let count: Int = Int(UInt32.max) + 1
        let d = Data(count: count)
        try! ZippyJSONDecoder().decode(Cc.self, from: d)*/
    }

    func testJSONKeyCleanupMemorySafe() {
        class Holder {
            var path: [CodingKey]? = nil
            init() {
            }
        }
        struct Aa: Codable & Equatable {
            let b: Bb
        }
        struct Bb: Codable & Equatable {
            let c: Int
            init(from decoder: Decoder) {
                let holder = (decoder.userInfo[CodingUserInfoKey(rawValue: "key")!]) as! Holder
                holder.path = decoder.codingPath
                c = 0
            }
        }
        let holder = Holder()
        autoreleasepool {
            let decoder = ZippyJSONDecoder()
            decoder.userInfo[CodingUserInfoKey(rawValue: "key")!] = holder
            let json = #"{"b": 1}"#.data(using: .utf8)!
            let _ = try! decoder.decode(Aa.self, from: json)
        }
        let _ = holder.path![0].stringValue
    }

    func testJSONKeyCleanupThreadSafe() {
        struct Aa: Codable & Equatable {
            let b: Bb
        }
        struct Bb: Codable & Equatable {
            let c: Cc
        }
        struct Cc: Codable & Equatable {
            enum Key: String, CodingKey{
                case one
                case two
            }
            let i: Int
            init(from decoder: Decoder) throws {
                let codingPath = decoder.codingPath
                DispatchQueue.global(qos: .userInteractive).async {
                    let _ = codingPath[0].stringValue
                    let keys = JSONKey.create(["b", "c"])
                    if !pathsEqual(codingPath, keys) {
                        abort()
                    }
                }
                i = try decoder.singleValueContainer().decode(Int.self)
                let _ = codingPath[0].stringValue
            }
        }
        {
            let decoder = ZippyJSONDecoder()
            let json = #"{"b": {"c": 2}}"#.data(using: .utf8)!
            let _ = try! decoder.decode(Aa.self, from: json)
        }()
        usleep(50000)
    }

    func testInvalidDates() {
        let secondsError = dateError("Expected double/float but found Bool instead.")
        testRoundTrip(of: [Date].self, json: "[23908742398047]", dateDecodingStrategy: .secondsSince1970)
        _testFailure(of: [Date].self, json: "[false]", expectedError: secondsError, dateDecodingStrategy: .secondsSince1970)
        
        let millisError = dateError("Expected double/float but found Bool instead.")
        testRoundTrip(of: [Date].self, json: "[23908742398047]", dateDecodingStrategy: .millisecondsSince1970)
        _testFailure(of: [Date].self, json: "[false]", expectedError: millisError, dateDecodingStrategy: .millisecondsSince1970)

        let error = dateError("Expected date string to be ISO8601-formatted.")
        let typeError = DecodingError.typeMismatch(Any.self, DecodingError.Context(codingPath: JSONKey.create([0]), debugDescription: "Expected to decode PKc but found Number instead."))

        testRoundTrip(of: [Date].self, json: #"["2016-06-13T16:00:00+00:00"]"#, dateDecodingStrategy: .iso8601)
        _testFailure(of: [Date].self, json: "[23908742398047]", expectedError: typeError, dateDecodingStrategy: .iso8601)
        _testFailure(of: [Date].self, json: #"["23908742398047"]"#, expectedError: error, dateDecodingStrategy: .iso8601)
        
        testRoundTrip(of: [Date].self, json: #"["1992"]"#, dateDecodingStrategy: .custom({ _ -> Date in
            return Date(timeIntervalSince1970: 0)
        }))
        _testFailure(of: [Date].self, json: "[23908742398047]", expectedError: error, dateDecodingStrategy: .custom({ _ -> Date in
            throw error
        }))
        
        let formatter = DateFormatter()
        let formatterError = dateError("Date string does not match format expected by formatter.")
        formatter.dateFormat = "yyyy"
        testRoundTrip(of: [Date].self, json: #"["1992"]"#, dateDecodingStrategy: .formatted(formatter))
        _testFailure(of: [Date].self, json: #"["March"]"#, expectedError: formatterError, dateDecodingStrategy: .formatted(formatter))
        _testFailure(of: [Date].self, json: "[23423423]", expectedError: typeError, dateDecodingStrategy: .formatted(formatter))
    }

    func testDefaultFloatStrings() {
        _testFailure(of: [Float].self, json: #"[""]"#)
    }

  func testLesserUsedFunctions() {
    struct NestedArrayMember: Codable, Equatable {
      let a: Int
    }
    struct Test: Codable, Equatable {
      let nestedArray: [NestedArrayMember]
      init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: JSONKey(stringValue: "array")!)
        let nestedArrayMember = try unkeyedContainer.decode(NestedArrayMember.self)
        nestedArray = [nestedArrayMember]
      }
    }

    testRoundTrip(of: Test.self, json: #"{"array": [{"a": 3}]}"#)
  }

    func _testFailure<T>(of value: T.Type,
                           json: String,
                           relaxedErrorCheck: Bool = false,
                           expectedError: Error? = nil,
                           outputFormatting: JSONEncoder.OutputFormatting = [],
                           dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate,
                           dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy = .deferredToDate,
                           dataEncodingStrategy: JSONEncoder.DataEncodingStrategy = .base64,
                           dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy = .base64,
                           keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys,
                           keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                           nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy = .throw,
                           nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy = .throw) where T : Decodable, T : Equatable {
        let decoder = ZippyJSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.dataDecodingStrategy = dataDecodingStrategy
        decoder.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        var zippyErrorMaybe: DecodingError?
        do {
            let _ = try decoder.decode(T.self, from: json.data(using: .utf8)!)
            XCTFail()
        } catch {
            zippyErrorMaybe = error as? DecodingError
        }
        guard let zippyError = zippyErrorMaybe else {
            XCTFail()
            return
        }
        do {
            let d = JSONDecoder()
            d.dateDecodingStrategy = ZippyJSONDecoder.convertDateDecodingStrategy(dateDecodingStrategy)
            d.dataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
            d.nonConformingFloatDecodingStrategy = ZippyJSONDecoder.convertNonConformingFloatDecodingStrategy(nonConformingFloatDecodingStrategy)
            d.keyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
            let _ = try d.decode(T.self, from: json.data(using: .utf8)!)
        } catch {
            guard let appleError = error as? DecodingError else {
                XCTFail()
                return
            }
            if !relaxedErrorCheck {
                XCTAssertEqual(appleError, zippyError)
            }
            return
        }
        XCTFail()
    }

    func testDictionaryStuff() {
        struct Test: Codable, Equatable {
            let a: Bool
        }
        //testRoundTrip(of: Test.self, json: #"{"a": true}"#)
        //testRoundTrip(of: TopLevelWrapper<Test>.self, json: #"{"value": {"a": true}}"#)
        //_testFailure(of: Test.self, json: #"{"b": true}"#, expectedError: DecodingError.keyNotFound(JSONKey(stringValue: "a")!, DecodingError.Context(codingPath: [], debugDescription: "No value associated with a.")))
        //_testFailure(of: Test.self, json: #"{}"#, expectedError: DecodingError.keyNotFound(JSONKey(stringValue: "a")!, DecodingError.Context(codingPath: [], debugDescription: "No value associated with a.")))
        //_testFailure(of: TopLevelWrapper<Test>.self, json: #"{"value": {}}"#, expectedError: DecodingError.keyNotFound(JSONKey(stringValue: "a")!, DecodingError.Context(codingPath: [], debugDescription: "No value associated with a.")))
        _testFailure(of: TopLevelWrapper<Test>.self, json: #"{"value": {"b": true}}"#, expectedError: nil) //DecodingError.keyNotFound(JSONKey(stringValue: "a")!, DecodingError.Context(codingPath: [JSONKey(stringValue: "value")!], debugDescription: "No value associated with a.")))
    }

    func testNestedDecoding() {
        struct Test: Codable, Equatable {
            init(from decoder: Decoder) throws {
                if (try! ZippyJSONDecoder().decode([Int].self, from: "[1]".data(using: .utf8)!) != [1]) {
                    abort()
                }
            }
        }
        testRoundTrip(of: Test.self, json: "{}")
    }

    func testEmptyString() {
        _testFailure(of: [Int].self, json: "", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid JSON. Error: Empty")))
    }

    func testArrayStuff() {
        struct Test: Codable, Equatable {
            let a: Bool
            let b: Bool

            init(a: Bool, b: Bool) {
                self.a = a
                self.b = b
            }

            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                a = try container.decode(Bool.self)
                b = try container.decode(Bool.self)
            }
        }

        // Goes past the end
        _testFailure(of: Test.self, json: "[true]", expectedError: DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Cannot get next value -- unkeyed container is at end.")))
        //_testFailure(of: Test.self, json: "[]", expectedError: DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [], debugDescription: "Cannot get next value -- unkeyed container is at end.")))
        _testFailure(of: TopLevelWrapper<Test>.self, json: #"{"value": [true]}"#, expectedError: DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [JSONKey(stringValue: "value")!, JSONKey(index: 0)], debugDescription: "Cannot get next value -- unkeyed container is at end.")))
        _testFailure(of: TopLevelWrapper<Test>.self, json: #"{"value": []}"#, expectedError: DecodingError.valueNotFound(Any.self, DecodingError.Context(codingPath: [JSONKey(stringValue: "value")!], debugDescription: "Cannot get next value -- unkeyed container is at end.")))
        // Left over
        testRoundTrip(of: Test.self, json: "[false, true, false]")
        // Normals
        testRoundTrip(of: Test.self, json: "[false, true]")
        testRoundTrip(of: [[[[Int]]]].self, json: "[[[[]]]]")
        testRoundTrip(of: [[[[Int]]]].self, json: "[[[[2, 3]]]]")
        testRoundTrip(of: [Bool].self, json: "[false, true]")
        _testFailure(of: [Int].self, json: #"{"a": 1}"#, expectedError: DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: [], debugDescription: "Tried to unbox array, but it wasn\'t an array")))
    }

    func testInvalidJSON() {
        _testFailure(of: [Int].self, json: "{a: 255}", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid JSON. Error: Something went wrong while writing to the tape")))
        _testFailure(of: [Int].self, json: #"{"key: "yes"}"#, expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "The given data was not valid JSON. Error: Something went wrong while writing to the tape")))
    }
    
    func testRawValuePassedAsJson() {
        testRoundTrip(of: Bool.self, json: "false")
        testRoundTrip(of: Bool.self, json: #"true"#)
        testRoundTrip(of: Int.self, json: "82")
        _testFailure(of: Int.self, json: "82.1")
        testRoundTrip(of: Double.self, json: "82.1")
        testRoundTrip(of: String.self, json: #""test""#)
        _testFailure(of: Int.self, json: #"undefined"#)
    }

    func testMultipleRefsToSameDecoder() {
        struct Aa: Codable, Equatable {
            let value: Int
            init(from decoder: Decoder) throws {
                var c1 = try decoder.unkeyedContainer()
                var c2 = try decoder.unkeyedContainer()
                // Get c1 to skip ahead
                let _ = try c1.decode(Int.self)
                value = try c2.decode(Int.self)
            }
        }
        testRoundTrip(of: Aa.self, json: "[20]")
    }

    func testInts() {
        testRoundTrip(of: Int64.self, json: "\(Int64.max)")
        testRoundTrip(of: UInt64.self, json: "\(UInt64.max)")
        _testFailure(of: Int64.self, json: "\(UInt64.max)")
        testRoundTrip(of: Double.self, json: "\(Int64.max)")
        testRoundTrip(of: Double.self, json: "\(UInt64.max)")
        testRoundTrip(of: UInt64.self, json: "\(UInt64.max)")
        testRoundTrip(of: [Int8].self, json: "[127]")
        testRoundTrip(of: [UInt8].self, json: "[255]")
        _testFailure(of: [UInt8].self, json: "[256]", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Parsed JSON number 256 does not fit.")))
        _testFailure(of: [UInt8].self, json: "[-1]", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Parsed JSON number -1 does not fit.")))
        testRoundTrip(of: [Int64].self, json: "[\(Int64.max)]")
        testRoundTrip(of: [Int64].self, json: "[\(Int64.min)]")
        testRoundTrip(of: [UInt64].self, json: "[\(UInt64.max)]")
    }

    func testDifferentTypes() {
        struct Test: Codable, Equatable {
            let i8: Int8
            let i16: Int16
            let i32: Int32
            let i64: Int64
            let u8: UInt8
            let u16: UInt16
            let u32: UInt32
            let u64: UInt64
            let u: UInt64
            let i: Int
        }
        let expected = Test(i8: 1, i16: 2, i32: 3, i64: 4, u8: 5, u16: 6, u32: 7, u64: 8, u: 9, i: 10)
        testRoundTrip(of: Test.self, json: #"{"u8": 1, "u16": 2, "u32": 3, "u64": 4, "i8": 5, "i16": 6, "i32": 7, "i64": 8, "u": 9, "i": 10}"#)
    }

    func testAllKeys() {
        struct Test: Codable {
            let keys: [String]
            init(from decoder: Decoder) throws {
                let container = try! decoder.container(keyedBy: JSONKey.self)
                keys = container.allKeys.map { $0.stringValue }
            }
        }
        let test = try! ZippyJSONDecoder().decode(Test.self, from: #"{"a": 1, "b": 2}"#.data(using: .utf8)!)
        XCTAssertEqual(test.keys, ["a", "b"])
    }

    func testDoubleParsing() {
        testRoundTrip(of: [Double].self, json: "[0.0]")
        testRoundTrip(of: [Double].self, json: "[0.0000]")
        testRoundTrip(of: [Double].self, json: "[-0.0]")
        testRoundTrip(of: [Double].self, json: "[1.0]")
        testRoundTrip(of: [Double].self, json: "[1.11111]")
        testRoundTrip(of: [Double].self, json: "[1.11211e-2]")
        testRoundTrip(of: [Double].self, json: "[1.11211e200]")
    }

    // Run with tsan
    func testConcurrentUsage() {
        let d = ZippyJSONDecoder()
        let testResult = try! d.decode(Twitter.self, from: twitterData)
        var value: Int32 = 0
        for _ in 0..<100 {
            DispatchQueue.global(qos: .userInteractive).async {
                assert(testResult == (try! d.decode(Twitter.self, from: self.twitterData)))
                OSAtomicIncrement32(&value)
            }
        }
        while value < 100 {
            usleep(UInt32(1e5))
        }
    }

    func testCodingKeys() {
        struct Test: Codable, Equatable {
            let a: Int
            let c: Int

            enum CodingKeys: String, CodingKey {
                case a = "b"
                case c
            }
        }

        testRoundTrip(of: Test.self, json: #"{"b": 1, "c": 2}"#)
    }
    
    func testSuppressWarnings() {
        struct Aa: Decodable {
            init(from decoder: Decoder) throws {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: ""))
            }
        }
        XCTAssertThrowsError(try ZippyJSONDecoder().decode(Aa.self, from: "{5345893478957345903475890734}".data(using: .utf8)!))
        testRoundTrip([UInt64.max])
        ZippyJSONDecoder.zjd_suppressWarnings = true
        testRoundTrip([UInt64.max])
        ZippyJSONDecoder.zjd_suppressWarnings = false
    }

    func testDecimal() {
        let decimals: [Decimal] = [1.2, 1]
        testRoundTrip(decimals)
        // NSDecimalNumber doesn't conform to Decodable
        //let nsDecimals: [NSDecimalNumber] = [1.2, 1]
        //testRoundTrip(nsDecimals)
        
        /*struct Aa: Equatable & Codable {
            init(from decoder: Decoder) throws {
                //let value = (decoder as! __JSONDecoder)
                var outLength: Int32 = 0
                let string = "{}"
                string.withCString { (cString) -> Void in
                    let context = JNTCreateContext(cString, UInt32(string.count), "".utf8CString, "".utf8CString, "".utf8CString)
                    let value = JNTDocumentFromJSON(context, UnsafeRawPointer(cString), string.count, false, nil, true)
                    JNTDocumentDecode__DecimalString(value, &outLength)
                }
            }
        }*/
        
        //_testFailure(of: Aa.self, json: "{}", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Invalid Decimal")))
        
        _testFailure(of: [Decimal].self, json: "[true]", expectedError: DecodingError.dataCorrupted(DecodingError.Context(codingPath: [JSONKey(index: 0)], debugDescription: "Invalid Decimal")))
    }

    func testNull() {
        struct Test: Codable, Equatable {
            let a: Int?
        }
        testRoundTrip(of: Test.self, json: #"{"a": null}"#)
    }

    func run<T: Codable & Equatable>(_ filename: String, _ type: T.Type, keyDecoding: ZippyJSONDecoder.KeyDecodingStrategy = .useDefaultKeys, dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy = .deferredToDate) {
        let json = dataFromFile(filename + ".json")
        testRoundTrip(of: type, json: String(data: json, encoding: .utf8)!,
                      dateDecodingStrategy: dateDecodingStrategy, testPerformance: false)
    }

    func testArrayTypes() {
        struct Test: Codable, Equatable {
            init(from decoder: Decoder) throws {
                var c = try! decoder.unkeyedContainer()
                a = try! c.decode(Int8.self)
                b = try! c.decode(Int16.self)
                cc = try! c.decode(Int32.self)
                d = try! c.decode(Int64.self)
                e = try! c.decode(Int.self)
                f = try! c.decode(UInt8.self)
                g = try! c.decode(UInt16.self)
                h = try! c.decode(UInt32.self)
                i = try! c.decode(UInt64.self)
                j = try! c.decode(UInt.self)
                k = try! c.decode(Float.self)
                l = try! c.decode(Double.self)
            }
            let a: Int8
            let b: Int16
            let cc: Int32
            let d: Int64
            let e: Int
            let f: UInt8
            let g: UInt16
            let h: UInt32
            let i: UInt64
            let j: UInt
            let k: Float
            let l: Double
        }
        testRoundTrip(of: Test.self, json: "[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]")
    }

    func testRealJsons() {
        run("apache_builds", ApacheBuilds.self)
        run("random", random.self)
        run("mesh", mesh.self)
        run("canada", canada.self)
        run("github_events", ghEvents.self, dateDecodingStrategy: .iso8601)
        run("twitter", Twitter.self, keyDecoding: .convertFromSnakeCase)
        run("twitterescaped", Twitter.self)
    }
}
