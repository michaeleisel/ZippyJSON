///
///  EncodingTester.swift
///  Sticky
///
///  Created by Tony Stone on 10/8/17.
///
///
import XCTest

import ZippyJSON

///
/// Generic func to test encoding and decoding round trip.
///
internal func _testCodableRoundTrip<T : Codable>(input: T, file: StaticString = #file, line: UInt = #line, validation: (T) -> Void) {
    do {
        let encoder = JSONEncoder()
        let decoder = ZippyJSONDecoder()

        let data   = try encoder.encode(input)
        let result = try decoder.decode(T.self, from: data)

        validation(result)

    } catch { XCTFail("Expected test not to throw but threw: \(error)", file: file, line: line) }
}

///
/// Generic func to test  that decoding throws a `DecodingError.typeMismatch` when required to.
///
internal func _testDecodeTypeMismatch<I,T>(input: I, expected: (type: T.Type, errorType: Any.Type, codingPath: [CodingKey], description: String), file: StaticString = #file, line: UInt = #line) where I: Codable, T: Codable {
    do {
        let encoder = JSONEncoder()
        let decoder = ZippyJSONDecoder()

        let data = try encoder.encode(input)

        XCTAssertThrowsError(try decoder.decode(expected.type, from: data)) { (error) in
        }
    } catch { XCTFail("Expected test not to throw but threw: \(error)", file: file, line: line) }
}

///
/// Generic func to test  that decoding throws a `DecodingError.valueNotFound` when required to.
///
internal func _testDecodeValueNotFound<I,T,E>(input: I, expected: (type: T.Type, errorType: E.Type, codingPath: [CodingKey], description: String), file: StaticString = #file, line: UInt = #line) where I: Codable, T: Codable {
    do {
        let encoder = JSONEncoder()
        let decoder = ZippyJSONDecoder()

        let data = try encoder.encode(input)

        XCTAssertThrowsError(try decoder.decode(expected.type, from: data)) { (error) in
        }
    } catch { XCTFail("Expected test not to throw but threw: \(error)", file: file, line: line) }
}

///
/// Generic func to test  that decoding throws a `DecodingError.keyNotFound` when required to.
///
internal func _testDecodeKeyNotFound<I,T>(input: I, expected: (type: T.Type, key: CodingKey, codingPath: [CodingKey], description: String), file: StaticString = #file, line: UInt = #line) where I: Codable, T: Codable {
    do {
        let encoder = JSONEncoder()
        let decoder = ZippyJSONDecoder()

        let data = try encoder.encode(input)

        XCTAssertThrowsError(try decoder.decode(expected.type, from: data)) { (error) in
        }
    } catch { XCTFail("Expected test not to throw but threw: \(error)", file: file, line: line) }
}
