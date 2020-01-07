//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation
import ZippyJSONCFamily
import JJLISO8601DateFormatter

typealias Value = UnsafeMutablePointer<DecoderDummy>

fileprivate var _iso8601Formatter: JJLISO8601DateFormatter = {
    let formatter = JJLISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()

internal protocol DictionaryWithoutKeyConversion: DummyCreatable {
    static var elementType: Decodable.Type { get }
}

extension Dictionary: DummyCreatable where Key == String, Value: Decodable {
    static func dummy() -> Dictionary<Key, Value> {
        return [:]
    }
    
}

extension Dictionary : DictionaryWithoutKeyConversion where Key == String, Value: Decodable {
    static var elementType: Decodable.Type { return Value.self }
}

func isOnSimulator() -> Bool {
  #if targetEnvironment(simulator)
  return true
  #else
  return false
  #endif
}

public final class ZippyJSONDecoder {
    public var zjd_fullPrecisionFloatParsing = true
    
    private static var _zjd_suppressWarnings: Bool = false
    public static var zjd_suppressWarnings: Bool {
        get {
            return _zjd_suppressWarnings
        }
        set {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            _zjd_suppressWarnings = newValue
        }
    }

    private func createContext(string: UnsafePointer<Int8>, length: Int) -> ContextPointer {
        switch nonConformingFloatDecodingStrategy {
        case .convertFromString(let pI, let nI, let nan):
            return pI.withCString { pIP in
                nI.withCString { nIP in
                    nan.withCString { nanP in
                        return JNTCreateContext(string, UInt32(length), nIP, pIP, nanP)
                    }
                }
            }
        case .throw:
            return JNTCreateContext(string, UInt32(length), "", "", "")
        }
    }

    public func decode<T : Decodable>(_ type: T.Type, from data: Data) throws -> T {
        if isOnSimulator() && !JNTHasVectorExtensions() {
          return try decodeWithAppleDecoder(type, from: data, reason: "This library was not compiled with the necessary vector extensions (this is likely because you're using SwiftPM + the simulator, and is due to limitations with SwiftPM. This does not apply to real devices.)")
        }
        if case .custom(_) = keyDecodingStrategy {
            return try decodeWithAppleDecoder(type, from: data, reason: "Custom key decoding is not supported, because it is uncommon and makes efficient parsing difficult")
        }
        return try data.withUnsafeBytes { (bytes) -> T in
            var retryReason: UnsafePointer<CChar>? = nil
            let string = bytes.baseAddress?.assumingMemoryBound(to: Int8.self)
            let context = createContext(string: string!, length: data.count)
            defer {
                JNTReleaseContext(context)
            }
            let value: Value? = JNTDocumentFromJSON(context, bytes.baseAddress!, data.count, convertCase, &retryReason, zjd_fullPrecisionFloatParsing)
            if let value = value {
                let decoder = __JSONDecoder(value: value, containers: JSONDecodingStorage(), keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy)
                if JNTErrorDidOccur(context) {
                    throw swiftErrorFromError(context)
                }
                let result = try decoder.unbox(value, as: type)
                
                if JNTErrorDidOccur(context) {
                    throw swiftErrorFromError(context)
                }
                return result
            } else {
                if !JNTErrorDidOccur(context) {
                    // The JSON is OK but it should be redone by apple
                    var retryReasonString: String? = nil
                    if let retryReason = retryReason {
                        retryReasonString = String(utf8String: retryReason)!
                    }
                    return try decodeWithAppleDecoder(type, from: data, reason: retryReasonString)
                } else {
                    throw swiftErrorFromError(context)
                }
            }
        }
    }

    func decodeWithAppleDecoder<T : Decodable>(_ type: T.Type, from data: Data, reason: String?) throws -> T {
        let appleDecoder = Foundation.JSONDecoder()
        appleDecoder.dataDecodingStrategy = ZippyJSONDecoder.convertDataDecodingStrategy(dataDecodingStrategy)
        appleDecoder.dateDecodingStrategy = ZippyJSONDecoder.convertDateDecodingStrategy(dateDecodingStrategy)
        appleDecoder.keyDecodingStrategy = ZippyJSONDecoder.convertKeyDecodingStrategy(keyDecodingStrategy)
        appleDecoder.nonConformingFloatDecodingStrategy = ZippyJSONDecoder.convertNonConformingFloatDecodingStrategy(nonConformingFloatDecodingStrategy)
        appleDecoder.userInfo = userInfo
        if !ZippyJSONDecoder.zjd_suppressWarnings {
            print("[ZippyJSONDecoder] Warning: fell back to using Apple's JSONDecoder. Reason: \(reason ?? ""). This message will only be printed the first time this happens. To suppress this message entirely, for all reasons, use `ZippyJSONDecoder.zjd_suppressWarnings = true")
            ZippyJSONDecoder.zjd_suppressWarnings = true
        }
        return try appleDecoder.decode(type, from: data)
    }

    static public func convertNonConformingFloatDecodingStrategy(_ strategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy) -> Foundation.JSONDecoder.NonConformingFloatDecodingStrategy {
        switch strategy {
        case .convertFromString(let positiveInfinity, let negativeInfinity, let nan):
            return .convertFromString(positiveInfinity: positiveInfinity, negativeInfinity: negativeInfinity, nan: nan)
        case .throw:
            return .throw
        }
    }

    static public func convertDateDecodingStrategy(_ strategy: ZippyJSONDecoder.DateDecodingStrategy) -> Foundation.JSONDecoder.DateDecodingStrategy {
        switch strategy {
        case .custom(let converter):
            return Foundation.JSONDecoder.DateDecodingStrategy.custom(converter)
        case .deferredToDate:
            return Foundation.JSONDecoder.DateDecodingStrategy.deferredToDate
        case .iso8601:
            return Foundation.JSONDecoder.DateDecodingStrategy.iso8601
        case .millisecondsSince1970:
            return Foundation.JSONDecoder.DateDecodingStrategy.millisecondsSince1970
        case .secondsSince1970:
            return Foundation.JSONDecoder.DateDecodingStrategy.secondsSince1970
        case .formatted(let formatter):
            return Foundation.JSONDecoder.DateDecodingStrategy.formatted(formatter)
        }
    }

    static public func convertDataDecodingStrategy(_ strategy: ZippyJSONDecoder.DataDecodingStrategy) -> Foundation.JSONDecoder.DataDecodingStrategy {
        switch strategy {
        case .base64:
            return Foundation.JSONDecoder.DataDecodingStrategy.base64
        case .custom(let converter):
            return Foundation.JSONDecoder.DataDecodingStrategy.custom(converter)
        case .deferredToData:
            return Foundation.JSONDecoder.DataDecodingStrategy.deferredToData
        }
    }

    static public func convertKeyDecodingStrategy(_ strategy: ZippyJSONDecoder.KeyDecodingStrategy) -> Foundation.JSONDecoder.KeyDecodingStrategy {
        switch strategy {
        case .convertFromSnakeCase:
            return Foundation.JSONDecoder.KeyDecodingStrategy.convertFromSnakeCase
        case .useDefaultKeys:
            return Foundation.JSONDecoder.KeyDecodingStrategy.useDefaultKeys
        case .custom(let converter):
            return Foundation.JSONDecoder.KeyDecodingStrategy.custom(converter)
        }
    }


    public var userInfo: [CodingUserInfoKey : Any] = [:]

    public var nonConformingFloatDecodingStrategy: NonConformingFloatDecodingStrategy

    public enum NonConformingFloatDecodingStrategy {
        case `throw`
        case convertFromString(positiveInfinity: String, negativeInfinity: String, nan: String)
    }

    public var dataDecodingStrategy: DataDecodingStrategy

    public enum DataDecodingStrategy {
        case deferredToData
        case base64
        case custom((Decoder) throws -> Data)
    }

    public enum KeyDecodingStrategy {
        case useDefaultKeys
        case convertFromSnakeCase
        case custom(([CodingKey]) -> CodingKey)
    }

    public var keyDecodingStrategy: KeyDecodingStrategy

    public enum DateDecodingStrategy {
        case deferredToDate
        case secondsSince1970
        case millisecondsSince1970
        case iso8601
        case formatted(DateFormatter)
        case custom((Decoder) throws -> Date)
    }

    public var dateDecodingStrategy: DateDecodingStrategy

    var convertCase: Bool {
        get {
            switch keyDecodingStrategy {
            case .convertFromSnakeCase:
                return true
            default:
                return false
            }
        }
    }

    public init() {
        keyDecodingStrategy = .useDefaultKeys
        dataDecodingStrategy = .base64
        dateDecodingStrategy = .deferredToDate
        nonConformingFloatDecodingStrategy = .throw
    }
}

fileprivate func swiftErrorFromError(_ context: ContextPointer) -> Error {
    var error: Error? = nil
    JNTProcessError(context) { (description, type, value, key) in
        let debugDescription = String(utf8String: description!)!
        var path = value.map { computeCodingPath(value: $0) } ?? []
        let keyString = key.map { String(utf8String: $0) ?? "" } ?? ""
        let key = JSONKey(stringValue: keyString)!
        // If there was an actual key given, remove the last part of the path and let the DecodingError take care of adding the passed in key to the end
        if key.stringValue != "" {
            let _ = path.popLast()
        }
        let instanceType = Any.self
        switch type {
        case .wrongType:
            error = DecodingError.typeMismatch(instanceType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .numberDoesNotFit:
            error = DecodingError.dataCorrupted(DecodingError.Context(codingPath: path, debugDescription:debugDescription))
        case .keyDoesNotExist:
            error = DecodingError.keyNotFound(key, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .valueDoesNotExist:
            error = DecodingError.valueNotFound(instanceType, DecodingError.Context(codingPath: path, debugDescription: debugDescription))
        case .jsonParsingFailed:
            error = DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: debugDescription))
        case .none:
            fallthrough
        @unknown default:
            break
        }
    }
    return error ?? NSError(domain: "", code: 0, userInfo: [:])
}

final private class JSONDecodingStorage {
    private(set) fileprivate var containers: [Value] = []

    fileprivate init() {
    }
    
    fileprivate func createCopy() -> JSONDecodingStorage {
        let copy = JSONDecodingStorage()
        copy.containers = containers
        return copy
    }

    fileprivate var topContainer: Value {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        return self.containers.last!
    }

    fileprivate func push(container: Value) {
        self.containers.append(container)
    }

    fileprivate func popContainer() {
        precondition(!self.containers.isEmpty, "Empty container stack.")
        self.containers.removeLast()
    }
}

private func computeCodingPath(value: Value, removeLastIfDictionary: Bool = true) -> [JSONKey] {
    var codingPath = JNTDocumentCodingPath(value).compactMap { element -> JSONKey? in
        if let index = element as? NSNumber {
            return JSONKey(index: index.intValue)
        } else if let key = element as? NSString {
            return JSONKey(stringValue: String(key))
        }
        return nil // Wouldn't happen
    }
    if removeLastIfDictionary, let last = codingPath.last, last.intValue == nil {
        codingPath.removeLast()
    }
    return codingPath
}

protocol AnyJSONKeyedDecoder: class {
}

extension JSONKeyedDecoder: AnyJSONKeyedDecoder {
}

/*protocol AnyKeyedDecodingContainer {
}

extension KeyedDecodingContainer: AnyKeyedDecodingContainer {
}*/

protocol DummyCreatable {
    static func dummy() -> Self
}

private class ArrayTypeCache {
    private var typeIdToDummy: [ObjectIdentifier: AnyArray] = [:]
    private var nonMatchingTypeIds = Set<ObjectIdentifier>()
    fileprivate func dummyForType(_ type: Decodable.Type) -> AnyArray? {
        let id = ObjectIdentifier(type)
        if nonMatchingTypeIds.contains(id) {
            return nil
        }
        if let dummy = typeIdToDummy[id] {
            return dummy
        }
        if let casted = type as? AnyArray.Type {
            //let dummyCreatable = casted as?
            let dummy = casted.dummy()
            typeIdToDummy[id] = dummy
            return dummy
        } else {
            nonMatchingTypeIds.insert(id)
            return nil
        }
    }
}

private class DictionaryTypeCache {
    private var typeIdToDummy: [ObjectIdentifier: DictionaryWithoutKeyConversion] = [:]
    private var nonMatchingTypeIds = Set<ObjectIdentifier>()
    fileprivate func dummyForType(_ type: Decodable.Type) -> DictionaryWithoutKeyConversion? {
        let id = ObjectIdentifier(type)
        if nonMatchingTypeIds.contains(id) {
            return nil
        }
        if let dummy = typeIdToDummy[id] {
            return dummy
        }
        if let casted = type as? DictionaryWithoutKeyConversion.Type {
            //let dummyCreatable = casted as?
            let dummy = casted.dummy()
            typeIdToDummy[id] = dummy
            return dummy
        } else {
            nonMatchingTypeIds.insert(id)
            return nil
        }
    }
}

protocol AnyWrapper: class {
}

extension Wrapper: AnyWrapper {
}

final private class Wrapper<K: CodingKey> {
    var decoder: JSONKeyedDecoder<K>
    init(decoder: JSONKeyedDecoder<K>) {
        self.decoder = decoder
    }
}

final private class KeyedContainerPool {
    var cache: [ObjectIdentifier: AnyWrapper] = [:]//(AnyKeyedDecodingContainer, AnyJSONKeyedDecoder)] = [:]
    
    func reserveContainer<Key: CodingKey>(decoder: __JSONDecoder, value: Value, convertToCamel: Bool) throws -> KeyedDecodingContainer<Key> {
        let id = ObjectIdentifier(Key.self)
        if let wrapper = cache[id] as? Wrapper<Key> {
            if isKnownUniquelyReferenced(&wrapper.decoder) {
                let innerDecoder = wrapper.decoder
                JNTReleaseValue(innerDecoder.value)
                (innerDecoder.value, innerDecoder.isEmpty) = try JSONKeyedDecoder<Key>.setupValue(value, decoder: decoder, convertToCamel: convertToCamel)
                return KeyedDecodingContainer(wrapper.decoder)
            }
        } else {
            let decoder = try JSONKeyedDecoder<Key>(decoder: decoder, value: value, convertToCamel: convertToCamel)
            cache[id] = Wrapper(decoder: decoder)
            return KeyedDecodingContainer(decoder)
        }
        let decoder = try JSONKeyedDecoder<Key>(decoder: decoder, value: value, convertToCamel: convertToCamel)
        return KeyedDecodingContainer(decoder)
    }
}

final private class __JSONDecoder: Decoder {
    var errorType: Any.Type? = nil
    var userInfo: [CodingUserInfoKey : Any] = [:]
    var codingPath: [CodingKey] {
        return computeCodingPath(value: containers.topContainer)
    }
    let keyedContainerPool = KeyedContainerPool()
    let value: Value
    let keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy
    let convertToCamel: Bool
    let dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy
    let dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy
    let nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy
    var swiftError: Error?
    var stringsForFloats: Bool
    let dictionaryTypeCache = DictionaryTypeCache()
    let arrayTypeCache = ArrayTypeCache()

    fileprivate var containers: JSONDecodingStorage

    init(value: Value, containers: JSONDecodingStorage, keyDecodingStrategy: ZippyJSONDecoder.KeyDecodingStrategy, dataDecodingStrategy: ZippyJSONDecoder.DataDecodingStrategy, dateDecodingStrategy: ZippyJSONDecoder.DateDecodingStrategy, nonConformingFloatDecodingStrategy: ZippyJSONDecoder.NonConformingFloatDecodingStrategy) {
        self.value = value
        self.containers = containers
        self.keyDecodingStrategy = keyDecodingStrategy
        if case .convertFromSnakeCase = keyDecodingStrategy {
            self.convertToCamel = true
        } else {
            self.convertToCamel = false
        }
        self.dataDecodingStrategy = dataDecodingStrategy
        self.dateDecodingStrategy = dateDecodingStrategy
        self.nonConformingFloatDecodingStrategy = nonConformingFloatDecodingStrategy
        switch (nonConformingFloatDecodingStrategy) {
        case .convertFromString(positiveInfinity: _, negativeInfinity: _, nan: _):
            stringsForFloats = true
        case .throw:
            stringsForFloats = false
        }
    }
    
    deinit {
        JNTReleaseValue(value)
    }
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        return try keyedContainerPool.reserveContainer(decoder: self, value: containers.topContainer, convertToCamel: convertToCamel)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        return try JSONUnkeyedDecoder(decoder: self, startingValue: containers.topContainer)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        return self
    }

    fileprivate func unboxDecimal(_ value: Value) -> Decimal? {
        if JNTDocumentValueIsDouble(value) {
            var length: Int32 = 0
            guard let cString = JNTDocumentDecode__DecimalString(value, &length) else { return nil }
            // Although it's mutable, in practice it won't be mutated
            let mutableCString = UnsafeMutableRawPointer(mutating: cString)
            guard let string = String(bytesNoCopy: mutableCString, length: Int(length),
                                      encoding: .utf8, freeWhenDone: false) else {
                return nil
            }
            return Decimal(string: string)
        } else if JNTDocumentValueIsInteger(value) {
            let number = unbox(value, as: Int64.self)
            return Decimal(number)
        } else {
            return nil
        }
    }

    fileprivate func unbox(_ value: Value, as type: Decimal.Type) throws -> Decimal {
        guard let decimal = unboxDecimal(value) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Invalid Decimal"))
        }
        return decimal
    }

    fileprivate func unbox(_ value: Value, as type: Date.Type) throws -> Date {
        switch dateDecodingStrategy {
        case .deferredToDate:
            containers.push(container: value)
            defer { containers.popContainer() }
            return try Date(from: self)

        case .secondsSince1970:
            let double = unbox(value, as: Double.self)
            return Date(timeIntervalSince1970: double)

        case .millisecondsSince1970:
            let double = unbox(value, as: Double.self)
            return Date(timeIntervalSince1970: double / 1000.0)

        case .iso8601:
            let string = self.unbox(value, as: String.self)
            guard let date = _iso8601Formatter.date(from: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
            }
            return date
        case .formatted(let formatter):
            let string = self.unbox(value, as: String.self)
            guard let date = formatter.date(from: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Date string does not match format expected by formatter."))
            }
            return date
        case .custom(let closure):
            containers.push(container: value)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func unbox(_ value: Value, as type: Data.Type) throws -> Data {
        switch dataDecodingStrategy {
        case .base64:
            let string = unbox(value, as: String.self)
            guard let data = Data(base64Encoded: string) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Encountered Data is not valid Base64."))
            }
            return data
        case .deferredToData:
            return try Data(from: self)
        case .custom(let closure):
            containers.push(container: value)
            defer { containers.popContainer() }
            return try closure(self)
        }
    }

    fileprivate func error(description: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }

    fileprivate func unbox<T>(_ value: Value, as type: DictionaryWithoutKeyConversion.Type) throws -> T {
        var result = [String : Any]()
        JNTDocumentForAllKeyValuePairs(value, { key, subValue in
            let keyString = String(cString: key!)
            result[keyString] = try! self.unbox_(subValue!, as: type.elementType)
        })
        if let resultCasted = result as? T {
            return resultCasted
        } else {
            throw error(description: "Dictionary cast failed") // Cannot happen
        }
    }

    fileprivate func unbox<T : Decodable>(_ value: Value, as type: T.Type) throws -> T {
        return (try unbox_(value, as: type)) as! T
    }

    fileprivate func unbox_(_ value: Value, as type: Decodable.Type) throws -> Any {
        containers.push(container: value)
        defer { containers.popContainer() }
        
        if type == Date.self || type == NSDate.self {
            return try unbox(value, as: Date.self)
        } else if type == Data.self || type == NSData.self {
            return try unbox(value, as: Data.self)
        } else if type == Decimal.self || type == NSDecimalNumber.self {
            return try unbox(value, as: Decimal.self)
        } else if type == URL.self || type == NSURL.self {
            let urlString = unbox(value, as: String.self)
            guard let url = URL(string: urlString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: codingPath,
                                                                        debugDescription: "Invalid URL string."))
             }
            return url
        //} else if let nType = type as? DictionaryWithoutKeyConversion.Type {
            //return try unbox(value, as: nType)
        } else if let _ = dictionaryTypeCache.dummyForType(type) {
            return try unbox(value, as: type as! DictionaryWithoutKeyConversion.Type)
        } else if let dummy = arrayTypeCache.dummyForType(type) {
            return try dummy.create(value: value, decoder: self)
        } else {
            return try type.init(from: self)
        }
    }
}

extension __JSONDecoder {
    // UnboxBegin
    fileprivate func unbox(_ value: Value, as type: UInt8.Type) -> UInt8 {
        let result = JNTDocumentDecode__uint8_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt16.Type) -> UInt16 {
        let result = JNTDocumentDecode__uint16_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt32.Type) -> UInt32 {
        let result = JNTDocumentDecode__uint32_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt64.Type) -> UInt64 {
        let result = JNTDocumentDecode__uint64_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int8.Type) -> Int8 {
        let result = JNTDocumentDecode__int8_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int16.Type) -> Int16 {
        let result = JNTDocumentDecode__int16_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int32.Type) -> Int32 {
        let result = JNTDocumentDecode__int32_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int64.Type) -> Int64 {
        let result = JNTDocumentDecode__int64_t(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Bool.Type) -> Bool {
        let result = JNTDocumentDecode__Bool(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: String.Type) -> String {
        let result = JNTDocumentDecode__String(value)
        if result == nil {
            return ""
        }
        return String(utf8String: result!)!
    }

    fileprivate func unbox(_ value: Value, as type: Double.Type) -> Double {
        let result = JNTDocumentDecode__Double(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Float.Type) -> Float {
        let result = JNTDocumentDecode__Float(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: Int.Type) -> Int {
        let result = JNTDocumentDecode__Int(value)
        return result
    }

    fileprivate func unbox(_ value: Value, as type: UInt.Type) -> UInt {
        let result = JNTDocumentDecode__UInt(value)
        return result
    }

    // End

    fileprivate func unboxNestedUnkeyedContainer(value: Value) throws -> UnkeyedDecodingContainer {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return try JSONUnkeyedDecoder(decoder: self, startingValue: value)
    }

    fileprivate func unboxSuper(_ value: Value) -> Decoder {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return __JSONDecoder(value: JNTDocumentCreateCopy(value), containers: containers.createCopy(), keyDecodingStrategy: keyDecodingStrategy, dataDecodingStrategy: dataDecodingStrategy, dateDecodingStrategy: dateDecodingStrategy, nonConformingFloatDecodingStrategy: nonConformingFloatDecodingStrategy)
    }

    fileprivate func unboxNestedContainer<NestedKey>(value: Value, keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        containers.push(container: value)
        defer {
            containers.popContainer()
        }
        return try keyedContainerPool.reserveContainer(decoder: self, value: value, convertToCamel: convertToCamel)
    }
}

fileprivate struct JSONKey : CodingKey {
    public var stringValue: String
    public var intValue: Int?

    public init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    public init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    public init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }

    fileprivate init(index: Int) {
        self.stringValue = "Index \(index)"
        self.intValue = index
    }

    fileprivate static let `super` = JSONKey(stringValue: "super")!
}

fileprivate let keyPlaceholder: JSONKey = JSONKey(index: 0)

/*private func arrayCodingPath(decoder: __JSONDecoder, currentValue: Value) -> [JSONKey] {
    guard self.count != 0 else {
        return decoder.codingPath
    }
    return computeCodingPath(value: currentValue)
}*/

private final class JSONUnkeyedDecoder : UnkeyedDecodingContainer {
    var currentValue: Value
    var count: Int?
    private unowned(unsafe) let decoder: __JSONDecoder
    var currentIndex: Int
    var isAtEnd: Bool

    var codingPath: [CodingKey] {
        return computeCodingPath(value: currentValue, removeLastIfDictionary: false)
    }
    
    deinit {
        JNTReleaseValue(currentValue);
    }

    fileprivate init(decoder: __JSONDecoder, startingValue: Value) throws {
        try JSONUnkeyedDecoder.ensureValueIsArray(value: startingValue)
        self.decoder = decoder
        self.currentIndex = 0
        var isEmpty = false
        let currentValue = JNTDocumentEnterStructureAndReturnCopy(startingValue, &isEmpty)!
        if isEmpty {
            self.isAtEnd = true
            self.count = 0
        } else {
            self.isAtEnd = false
            self.count = JNTDocumentGetArrayCount(currentValue)
        }
        self.currentValue = currentValue
    }

    func decodeNil() throws -> Bool {
        try ensureArrayIsNotAtEnd()
        let isNil = JNTDocumentDecodeNil(currentValue)
        if isNil {
            advanceArray()
        }
        return isNil
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        try ensureArrayIsNotAtEnd()
        let decoded = try decoder.unbox(currentValue, as: T.self)
        advanceArray()
        return decoded
    }

    func advanceArray() {
        JNTDocumentNextArrayElement(currentValue, &isAtEnd)
        currentIndex += 1
    }

    func ensureArrayIsNotAtEnd() throws {
        if isAtEnd {
            throw DecodingError.valueNotFound(Any.self,
                                              DecodingError.Context(codingPath: codingPath,
                                                                    debugDescription: "Cannot get next value -- unkeyed container is at end."))
        }
    }

    static func ensureValueIsArray(value: Value) throws {
        guard JNTDocumentValueIsArray(value) else {
            throw DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: computeCodingPath(value: value), debugDescription: "Tried to unbox array, but it wasn't an array"))
        }
    }

    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> {
        try ensureArrayIsNotAtEnd()
        let container = try decoder.unboxNestedContainer(value: currentValue, keyedBy: type)
        advanceArray()
        return container
    }

    func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        try ensureArrayIsNotAtEnd()
        let container = try decoder.unboxNestedUnkeyedContainer(value: currentValue)
        advanceArray()
        return container
    }

    func superDecoder() throws -> Decoder {
        try ensureArrayIsNotAtEnd()
        let container = decoder.unboxSuper(currentValue)
        advanceArray()
        return container
    }

    // UnkeyedBegin
    public func decode(_ type: UInt8.Type) throws -> UInt8 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: UInt8.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt16.Type) throws -> UInt16 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: UInt16.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt32.Type) throws -> UInt32 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: UInt32.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt64.Type) throws -> UInt64 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: UInt64.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int8.Type) throws -> Int8 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Int8.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int16.Type) throws -> Int16 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Int16.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int32.Type) throws -> Int32 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Int32.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int64.Type) throws -> Int64 {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Int64.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Bool.Type) throws -> Bool {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Bool.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: String.Type) throws -> String {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: String.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Double.Type) throws -> Double {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Double.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Float.Type) throws -> Float {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Float.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: Int.Type) throws -> Int {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: Int.self)
        advanceArray()
        return decoded
    }

    public func decode(_ type: UInt.Type) throws -> UInt {
        try ensureArrayIsNotAtEnd()
        let decoded = decoder.unbox(currentValue, as: UInt.self)
        advanceArray()
        return decoded
    }

    // End
}

private final class JSONKeyedDecoder<K : CodingKey> : KeyedDecodingContainerProtocol {
    var codingPath: [CodingKey] {
        return computeCodingPath(value: value, removeLastIfDictionary: !isEmpty)
    }

    unowned(unsafe) private let decoder: __JSONDecoder

    typealias Key = K

    var value: Value
    
    var isEmpty: Bool
    
    deinit {
        JNTReleaseValue(value)
    }

    static func ensureValueIsDictionary(value: Value) throws {
        guard JNTDocumentValueIsDictionary(value) else {
            throw DecodingError.typeMismatch([Any].self, DecodingError.Context(codingPath: [], debugDescription: "Tried to unbox dictionary, but it wasn't a dictionary"))
        }
    }

    fileprivate static func setupValue(_ value: Value, decoder: __JSONDecoder, convertToCamel: Bool) throws -> (Value, Bool) {
        try ensureValueIsDictionary(value: value)
        var isEmpty = false
        let innerValue = JNTDocumentEnterStructureAndReturnCopy(value, &isEmpty)!
        // todo: fix bug where the keys get converted and then used to create a dictionary later
        if (convertToCamel && !isEmpty) {
            JNTConvertSnakeToCamel(innerValue)
        }
        return (innerValue, isEmpty)
    }

    fileprivate init(decoder: __JSONDecoder, value: Value, convertToCamel: Bool) throws {
        try (self.value, self.isEmpty) = JSONKeyedDecoder<K>.setupValue(value, decoder: decoder, convertToCamel: convertToCamel)
        self.decoder = decoder
    }

    var allKeys: [Key] {
        return JNTDocumentAllKeys(value, isEmpty).compactMap { Key(stringValue: $0) }
    }

    func contains(_ key: K) -> Bool {
        return key.stringValue.withCString { pointer in
            return JNTDocumentContains(value, pointer, isEmpty)
        }
    }

    private func fetchValue(keyPointer: UnsafePointer<Int8>) -> Value {
        return JNTDocumentFetchValue(value, keyPointer, isEmpty)
    }

    func decodeNil(forKey key: K) throws -> Bool {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return JNTDocumentDecodeNil(subValue)
    }

    // KeyedBegin
    fileprivate func decode(_ type: UInt8.Type, forKey key: K) -> UInt8 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt8.self)
    }

    fileprivate func decode(_ type: UInt16.Type, forKey key: K) -> UInt16 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt16.self)
    }

    fileprivate func decode(_ type: UInt32.Type, forKey key: K) -> UInt32 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt32.self)
    }

    fileprivate func decode(_ type: UInt64.Type, forKey key: K) -> UInt64 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt64.self)
    }

    fileprivate func decode(_ type: Int8.Type, forKey key: K) -> Int8 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int8.self)
    }

    fileprivate func decode(_ type: Int16.Type, forKey key: K) -> Int16 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int16.self)
    }

    fileprivate func decode(_ type: Int32.Type, forKey key: K) -> Int32 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int32.self)
    }

    fileprivate func decode(_ type: Int64.Type, forKey key: K) -> Int64 {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int64.self)
    }

    fileprivate func decode(_ type: Bool.Type, forKey key: K) -> Bool {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Bool.self)
    }

    fileprivate func decode(_ type: String.Type, forKey key: K) -> String {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: String.self)
    }

    fileprivate func decode(_ type: Double.Type, forKey key: K) -> Double {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Double.self)
    }

    fileprivate func decode(_ type: Float.Type, forKey key: K) -> Float {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Float.self)
    }

    fileprivate func decode(_ type: Int.Type, forKey key: K) -> Int {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: Int.self)
    }

    fileprivate func decode(_ type: UInt.Type, forKey key: K) -> UInt {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return decoder.unbox(subValue, as: UInt.self)
    }

    fileprivate func decode<T : Decodable>(_ type: T.Type, forKey key: K) throws -> T {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return try decoder.unbox(subValue, as: T.self)
    }
    
    // End

    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return try decoder.unboxNestedContainer(value: subValue, keyedBy: type)
    }

    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        return try decoder.unboxNestedUnkeyedContainer(value: subValue)
    }

    private func _superDecoder(forKey key: CodingKey) throws -> Decoder {
        let subValue: Value = key.stringValue.withCString(fetchValue)
        // todo: throw exceptions here
        return decoder.unboxSuper(subValue)
    }

    func superDecoder() throws -> Decoder {
        return try _superDecoder(forKey: JSONKey.super)
    }

    func superDecoder(forKey key: Key) throws -> Decoder {
        return try _superDecoder(forKey: key)
    }
}

extension __JSONDecoder : SingleValueDecodingContainer {
    func decodeNil() -> Bool {
        return JNTDocumentDecodeNil(containers.topContainer)
    }

    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try unbox(containers.topContainer, as: T.self)
    }

    // SingleValueBegin
    public func decode(_ type: UInt8.Type) -> UInt8 {
        return unbox(containers.topContainer, as: UInt8.self)
    }

    public func decode(_ type: UInt16.Type) -> UInt16 {
        return unbox(containers.topContainer, as: UInt16.self)
    }

    public func decode(_ type: UInt32.Type) -> UInt32 {
        return unbox(containers.topContainer, as: UInt32.self)
    }

    public func decode(_ type: UInt64.Type) -> UInt64 {
        return unbox(containers.topContainer, as: UInt64.self)
    }

    public func decode(_ type: Int8.Type) -> Int8 {
        return unbox(containers.topContainer, as: Int8.self)
    }

    public func decode(_ type: Int16.Type) -> Int16 {
        return unbox(containers.topContainer, as: Int16.self)
    }

    public func decode(_ type: Int32.Type) -> Int32 {
        return unbox(containers.topContainer, as: Int32.self)
    }

    public func decode(_ type: Int64.Type) -> Int64 {
        return unbox(containers.topContainer, as: Int64.self)
    }

    public func decode(_ type: Bool.Type) -> Bool {
        return unbox(containers.topContainer, as: Bool.self)
    }

    public func decode(_ type: String.Type) -> String {
        return unbox(containers.topContainer, as: String.self)
    }

    public func decode(_ type: Double.Type) -> Double {
        return unbox(containers.topContainer, as: Double.self)
    }

    public func decode(_ type: Float.Type) -> Float {
        return unbox(containers.topContainer, as: Float.self)
    }

    public func decode(_ type: Int.Type) -> Int {
        return unbox(containers.topContainer, as: Int.self)
    }

    public func decode(_ type: UInt.Type) -> UInt {
        return unbox(containers.topContainer, as: UInt.self)
    }

    // End
}

/*public extension Decodable {
    func decode<T : Decodable, K: CodingKey>(_ type: T.Type, forKey key: K) throws -> T where T: Collection {
        abort()
    }
}

private func getSequence<T: Decodable>(decoder: __JSONDecoder, count: Int, value: Value) -> SequenceParent<T> {
    return ElementSequence<T>(decoder: decoder, count: count, value: value)
}

private func getSequence<T>(decoder: __JSONDecoder, count: Int, value: Value) -> SequenceParent<T> where T: AnyArray {//U where U.Element == T, T: AnyArray {
    return ArraySequence<T>(decoder: decoder, count: count, value: value)
}

private class SequenceParent<T: Decodable>: Sequence, IteratorProtocol {
    func next() -> T? {
        fatalError()
    }
}

private final class ArraySequence<T: Decodable & AnyArray>: SequenceParent<T> {
    private unowned(unsafe) let decoder: __JSONDecoder
    private let count: Int
    private let value: Value
    fileprivate var i = 0
    private var b = false
    var error: Error? = nil
    let dummy: T = T.dummy()
    
    fileprivate init(decoder: __JSONDecoder, count: Int, value: Value) {
        self.decoder = decoder
        self.count = count
        self.value = value
    }
    
    override func next() -> T? {
        if i >= count {
            return nil
        }
        do {
            let element: T = try dummy.create(value: value, decoder: decoder)
            i += 1
            JNTDocumentNextArrayElement(value, &b)
            return element
        } catch {
            self.error = error
        }
        return nil
    }
}*/

private final class ElementSequence<T: Decodable>: Sequence, IteratorProtocol {
    typealias Element = T
    private unowned(unsafe) let decoder: __JSONDecoder
    private let count: Int
    private let value: Value
    fileprivate var i = 0
    private var b = false
    var error: Error? = nil

    fileprivate init(decoder: __JSONDecoder, count: Int, value: Value) {
        self.decoder = decoder
        self.count = count
        self.value = value
    }
    
    func next() -> T? {
        if i >= count {
            return nil
        }
        do {
            let element = try decoder.unbox(value, as: Element.self)
            i += 1
            JNTDocumentNextArrayElement(value, &b)
            return element
        } catch {
            self.error = error
        }
        return nil
    }
}

fileprivate protocol AnyArray: DummyCreatable {
    func create(value: Value, decoder: __JSONDecoder) throws -> Self
}

/*extension AnyArray {
    fileprivate static func dummy() -> Self {
        abort()
    }
    
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        abort()
    }
}

extension Decodable where Self: Array<Any> {
    fileprivate init(from decoder: Decoder) throws {
        abort()
    }
}*/

extension Array: DummyCreatable where Element: Decodable {
    static func dummy() -> Self {
        return []
    }
}
    
extension Array: AnyArray where Element: Decodable {
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        try JSONUnkeyedDecoder.ensureValueIsArray(value: value)
        var isEmpty = false
        guard var currentValue = JNTDocumentEnterStructureAndReturnCopy(value, &isEmpty) else {
            return []
        }
        defer { JNTReleaseValue(currentValue) }
        if isEmpty {
            return []
        }
        decoder.containers.push(container: currentValue)
        defer { decoder.containers.popContainer() }
        let count = JNTDocumentGetArrayCount(currentValue)
        let array: [Element] = try Array(unsafeUninitializedCapacity: count) { (buffer, countToAssign) in
            // We can't use subscript mutation with buffer because Swift requires buffer to be initialized anywhere we mutate it
            // Instead, init from a lightweight sequence
            //let sequence: ElementSequence<Element> = ElementSequence(decoder: decoder, count: count, value: currentValue)
            //let _ = buffer.initialize(from: sequence)
            memset(buffer.baseAddress, 0, count * MemoryLayout<Element>.stride)
            var isAtEnd = false
            if let innerDummy = decoder.arrayTypeCache.dummyForType(Element.self) {
                for i in 0..<count {
                    do {
                        buffer[i] = try innerDummy.create(value: currentValue, decoder: decoder) as! Element
                        JNTDocumentNextArrayElement(currentValue, &isAtEnd)
                    } catch {
                        countToAssign = i
                        throw error
                    }
                }
            } else {
                for i in 0..<count {
                    do {
                        buffer[i] = try decoder.unbox(currentValue, as: Element.self)
                        JNTDocumentNextArrayElement(currentValue, &isAtEnd)
                    } catch {
                        countToAssign = i
                        throw error
                    }
                }
            }
            countToAssign = count
            /*countToAssign = sequence.i
            if let error = sequence.error {
                throw error
            }*/
        }
        return array
    }
}

/*fileprivate protocol AnyAnyArray {}

extension Array: AnyAnyArray {}

fileprivate protocol AnyArray: Decodable {
    static func dummy() -> Self
    func create(value: Value, decoder: __JSONDecoder) throws -> Self
}

extension AnyArray {
    fileprivate static func dummy() -> Self {
        abort()
    }
    
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        abort()
    }
}

extension Array: AnyArray where Element: Decodable & AnyAnyArray {
    static func dummy() -> Array<Element> {
        abort()
    }

    func create(value: Value, decoder: __JSONDecoder) throws -> Array<Element> {
        abort()
    }
}

/*extension AnyArray where Self: Collection & ExpressibleByArrayLiteral {
    fileprivate static func dummy() -> Self {
        return []
    }
    
    fileprivate func create(value: Value, decoder: __JSONDecoder) throws -> Self {
        try JSONUnkeyedDecoder.ensureValueIsArray(value: value)
        guard var currentValue = JNTDocumentEnterStructureAndReturnCopy(value) else {
            return []
        }
        decoder.containers.push(container: currentValue)
        defer { decoder.containers.popContainer() }
        let count = JNTDocumentGetArrayCount(currentValue)
        let array: [Element] = try Array(unsafeUninitializedCapacity: count) { (buffer, countToAssign) in
            // We can't use subscript mutation with buffer because Swift requires buffer to be initialized anywhere we mutate it
            // Instead, init from a lightweight sequence
            let sequence: SequenceParent<Element> = getSequence(decoder: decoder, count: count, value: currentValue)//ElementSequence(decoder: decoder, count: count, value: currentValue)
            let _ = buffer.initialize(from: sequence)
            countToAssign = count//sequence.i
        }
        return array as! Self
    }
}

protocol DecodableCollection: Collection where Collection.Element: Decodable {
}

protocol NestedArray {}

extension Array: NestedArray where Element: Collection {}

extension Array: AnyArray where Element: Decodable {}*/*/
