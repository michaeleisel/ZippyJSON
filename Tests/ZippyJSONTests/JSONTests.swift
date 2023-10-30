import XCTest
import Foundation
import ZippyJSON

var newParser: ZippyJSONDecoder {
    return ZippyJSONDecoder()
}

//var parser: JSONDecoder {
//    return JSONDecoder()
//}

var newEncoder: JSONEncoder {
    return JSONEncoder()
}

final class JSONTests: XCTestCase {
    func testMissingCommaInObject() {
        let json = """
        {
            "yes": "✅",
            "bug": "🐛",
            "awesome": [true, false,     false, false,true]
            "flag": "🇳🇱"
        }
        """.data(using: .utf8)!

        struct Test: Codable {
            let yes: String
            let bug: String
            let awesome: [Bool]
            let flag: String
        }

        XCTAssertThrowsError(try newParser.decode(Test.self, from: json))
    }

    private func measureTime(run block: () throws -> ()) rethrows -> TimeInterval {
        let date = Date()
        try block()
        return Date().timeIntervalSince(date)
    }

    func testMissingCommaInArray() {
        let json = """
        {
            "yes": "✅",
            "bug": "🐛",
            "awesome": [true false,     false, false,true],
            "flag": "🇳🇱"
        }
        """.data(using: .utf8)!

        struct Test: Codable {
            let yes: String
            let bug: String
            let awesome: [Bool]
            let flag: String
        }

        XCTAssertThrowsError(try newParser.decode(Test.self, from: json))
    }

    func testMissingEndOfArray() {
        let json = """
        {
            "yes": "✅",
            "bug": "🐛",
            "awesome": [true, false,     false, false,true
        """.data(using: .utf8)!

        struct Test: Codable {
            let yes: String
            let bug: String
            let awesome: [Bool]
            let flag: String
        }

        XCTAssertThrowsError(try newParser.decode(Test.self, from: json))
    }

    func testMissingEndOfObject() {
        let json = """
        {
            "yes": "✅",
            "bug": "🐛",
            "awesome": [true, false,     false, false,true],
            "flag": "🇳🇱"
        """.data(using: .utf8)!

        struct Test: Codable {
            let yes: String
            let bug: String
            let awesome: [Bool]
            let flag: String
        }

        XCTAssertThrowsError(try newParser.decode(Test.self, from: json))
    }

    func testKeyDecoding() throws {
        let parser = newParser
        parser.keyDecodingStrategy = .convertFromSnakeCase

        struct Test: Codable {
            let userName: String
            let eMail: String
        }

        let json0 = """
        {
            "userName": "Joannis",
            "e_mail": "joannis@orlandos.nl"
        }
        """.data(using: .utf8)!

        let json1 = """
        {
            "user_name": "Joannis",
            "e_mail": "joannis@orlandos.nl"
        }
        """.data(using: .utf8)!

        do {
            let user = try parser.decode(Test.self, from: json0)
            XCTAssertEqual(user.userName, "Joannis")
            XCTAssertEqual(user.eMail, "joannis@orlandos.nl")
        } catch {
            XCTFail()
        }

        do {
            let user = try parser.decode(Test.self, from: json1)
            XCTAssertEqual(user.userName, "Joannis")
            XCTAssertEqual(user.eMail, "joannis@orlandos.nl")
        } catch {
            XCTFail()
        }
    }

    func testEmojis() throws {
        let json = """
        {
            "yes": "✅",
            "bug": "🐛",
            "flag": "🇳🇱"
        }
        """.data(using: .utf8)!

        struct Test: Decodable {
            let yes: String
            let bug: String
            let flag: String
        }

        let test = try newParser.decode(Test.self, from: json)
        XCTAssertEqual(test.yes, "✅")
        XCTAssertEqual(test.bug, "🐛")
        XCTAssertEqual(test.flag, "🇳🇱")
    }

    func testObject() throws {
        let json = """
        {
            "id": "0",
            "username": "Joannis",
            "role": "admin",
            "awesome": true,
            "superAwesome": false
        }
        """.data(using: .utf8)!

        struct User: Decodable {
            let id: String
            let username: String
            let role: String
            let awesome: Bool
            let superAwesome: Bool
        }

        let user = try! newParser.decode(User.self, from: json)

        XCTAssertEqual(user.id, "0")
        XCTAssertEqual(user.username, "Joannis")
        XCTAssertEqual(user.role, "admin")
        XCTAssertTrue(user.awesome)
        XCTAssertFalse(user.superAwesome)
    }

    func testArray() throws {
        let json = """
        {
            "id": "0",
            "username": "Joannis",
            "roles": ["admin", null, "member", "moderator"],
            "awesome": true,
            "superAwesome": false
        }
        """.data(using: .utf8)!

        struct User: Decodable {
            let id: String
            let username: String
            let roles: [String?]
            let awesome: Bool
            let superAwesome: Bool
        }

        let user = try! newParser.decode(User.self, from: json)

        XCTAssertEqual(user.id, "0")
        XCTAssertEqual(user.username, "Joannis")
        XCTAssertEqual(user.roles.count, 4)
        XCTAssertEqual(user.roles[0], "admin")
        XCTAssertEqual(user.roles[1], nil)
        XCTAssertEqual(user.roles[2], "member")
        XCTAssertEqual(user.roles[3], "moderator")
        XCTAssertTrue(user.awesome)
        XCTAssertFalse(user.superAwesome)
    }

    @available(OSX 10.12, *)
    func testISO8601DateStrategy() throws {
        let decoder = newParser
        decoder.dateDecodingStrategy = .iso8601

        let date = Date()
        let string = ISO8601DateFormatter().string(from: date)

        let json = """
        {
            "createdAt": "\(string)"
        }
        """.data(using: .utf8)!

        struct Test: Decodable {
            let createdAt: Date
        }

        let test = try decoder.decode(Test.self, from: json)

        // Because of Double rounding errors, this is necessary
        XCTAssertEqual(Int(test.createdAt.timeIntervalSince1970), Int(date.timeIntervalSince1970))
    }

    @available(OSX 10.12, *)
    func testEpochSecDateStrategy() throws {
        let decoder = newParser
        decoder.dateDecodingStrategy = .secondsSince1970

        let date = Date()

        let json = """
        {
            "createdAt": \(Int(date.timeIntervalSince1970))
        }
        """.data(using: .utf8)!

        struct Test: Decodable {
            let createdAt: Date
        }

        let test = try decoder.decode(Test.self, from: json)

        // Because of Double rounding errors, this is necessary
        XCTAssertEqual(Int(test.createdAt.timeIntervalSince1970), Int(date.timeIntervalSince1970))
    }

    @available(OSX 10.12, *)
    func testEpochMSDateStrategy() throws {
        let decoder = newParser
        decoder.dateDecodingStrategy = .millisecondsSince1970

        let date = Date()

        let json = """
            {
            "createdAt": \(Int(date.timeIntervalSince1970 * 1000))
            }
            """.data(using: .utf8)!

        struct Test: Decodable {
            let createdAt: Date
        }

        let test = try decoder.decode(Test.self, from: json)

        // Because of Double rounding errors, this is necessary
        XCTAssertEqual(Int(test.createdAt.timeIntervalSince1970), Int(date.timeIntervalSince1970))
    }

    func testEscaping() throws {
        let json = """
        {
            "id": "0",
            "username": "Joannis\\tis\\nawesome\\\\\\"",
            "roles": ["admin", null, "member", "moderator"],
            "awesome": true,
            "superAwesome": false
        }
        """.data(using: .utf8)!

        struct User: Decodable {
            let id: String
            let username: String
            let roles: [String?]
            let awesome: Bool
            let superAwesome: Bool
        }

        let user = try! newParser.decode(User.self, from: json)

        XCTAssertEqual(user.id, "0")
        XCTAssertEqual(user.username, "Joannis\tis\nawesome\\\"")
        XCTAssertEqual(user.roles.count, 4)
        XCTAssertEqual(user.roles[0], "admin")
        XCTAssertEqual(user.roles[1], nil)
        XCTAssertEqual(user.roles[2], "member")
        XCTAssertEqual(user.roles[3], "moderator")
        XCTAssertTrue(user.awesome)
        XCTAssertFalse(user.superAwesome)
    }

    func testNumerical() throws {
        let json = """
        {
            "piD": 3.14,
            "piF": 0.314e1,
            "piFm": 314e-2,
            "piFp": 0.0314e+2,
            "u8": 255,
            "u8zero": 0,
            "i8": -127,
            "imax": \(Int32.max),
            "imin": \(Int32.min)
        }
        """.data(using: .utf8)!

        struct Stuff: Decodable {
            let piD: Double
            let piF: Float
            let piFm: Float
            let piFp: Float
            let u8: UInt8
            let u8zero: UInt8
            let i8: Int8
            let imax: Int32
            let imin: Int32
        }

        let stuff = try newParser.decode(Stuff.self, from: json)

        XCTAssertEqual(stuff.piD, 3.14)
        XCTAssertEqual(stuff.piF, 3.14)
        XCTAssertEqual(stuff.piFm, 3.14)
        XCTAssertEqual(stuff.piFp, 3.14)
        XCTAssertEqual(stuff.u8, 255)
        XCTAssertEqual(stuff.u8zero, 0)
        XCTAssertEqual(stuff.i8, -127)
        XCTAssertEqual(stuff.imax, .max)
        XCTAssertEqual(stuff.imin, .min)
    }

    func testCodablePerformance() throws {
        let data = """
        {
            "awesome": true,
            "superAwesome": false
        }
        """.data(using: .utf8)!

        struct User: Decodable {
            let awesome: Bool
            let superAwesome: Bool
        }

        for _ in 0..<1 {
            _ = try! newParser.decode(User.self, from: data)
        }
    }

    func testInvalidJSONCase() {
        let object = """
        {
            "hoi" "",
        }
        """

        struct Test: Codable {
            var hoi: String
        }

        let decoder = ZippyJSONDecoder()
        XCTAssertThrowsError(try decoder.decode(Test.self, from: object.data(using: .utf8)!))
    }

    func testDataDecoding() throws {
        struct Datas: Codable {
            let data: Data
        }

        let decoder = ZippyJSONDecoder()

        decoder.dataDecodingStrategy = .deferredToData
        var datas = try decoder.decode(Datas.self, from: "{\"data\":[1,2,3]}".data(using: .utf8)!)
        XCTAssertEqual(datas.data, Data(bytes: [1,2,3]))

        decoder.dataDecodingStrategy = .custom({ _ in
            return Data(bytes: [1, 2, 3])
        })
        datas = try decoder.decode(Datas.self, from: "{\"data\":true}".data(using: .utf8)!)
        XCTAssertEqual(datas.data, Data(bytes: [1,2,3]))

        let data = Data(bytes: [0x01, 0x02, 0x03, 0x04, 0x05])
        decoder.dataDecodingStrategy = .base64
        datas = try decoder.decode(Datas.self, from: "{\"data\":\"\(data.base64EncodedString())\"}".data(using: .utf8)!)
        XCTAssertEqual(datas.data, data)
    }

    func testNestedArrayInObjectAccess() {

    }

    func testArrayAccess() {

    }

    func testNestedObjectInArrayAccess() {

    }

    func testNestedArrayInArrayAccess() {

    }

    static var allTests = [
        ("testObject", testObject),
        ("testArray", testArray),
        ("testEscaping", testEscaping),
        ("testNumerical", testNumerical),
        ("testCodablePerformance", testCodablePerformance),
    ]
}
