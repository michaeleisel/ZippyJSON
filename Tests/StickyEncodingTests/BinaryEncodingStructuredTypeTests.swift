///
///  BinaryEncodingStructuredTypeTests.swift
///
///  Copyright 2017 Tony Stone
///
///  Licensed under the Apache License, Version 2.0 (the "License");
///  you may not use this file except in compliance with the License.
///  You may obtain a copy of the License at
///
///  http://www.apache.org/licenses/LICENSE-2.0
///
///  Unless required by applicable law or agreed to in writing, software
///  distributed under the License is distributed on an "AS IS" BASIS,
///  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///  See the License for the specific language governing permissions and
///  limitations under the License.
///
///  Created by Tony Stone on 10/6/17.
///
import XCTest

import ZippyJSON

///
/// Tests relating to both `BinaryEncoder` and `BinaryDecoder` encoding structured types Array's, Dictionaries, and custom types.
///
class BinaryEncodingStructuredTypeTests: XCTestCase {

    // MARK: - `Array`

    ///
    /// Test the ability to encode/decode an Array of Ints.
    ///
    func testEncodingDecodeOfArrayOfInt() throws {
        let input:    [Int] = [1, 2, 3, 4, 5, 6]
        let expected: [Int] = [1, 2, 3, 4, 5, 6]

        _testCodableRoundTrip(input: input) { (result) in
            XCTAssertEqual(result, expected)
        }
    }

    // MARK: - `Dictionary`

    ///
    /// Test the ability to encode/decode a simple Dictionary<String, Int>.
    ///
    func testEncodingDecodeOfDictionaryOfEnum() throws {

        enum Enum { case zero, one, two, three, four, five, six }

        let input:    [String: Int] = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6]
        let expected: [String: Int] = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6]

        _testCodableRoundTrip(input: input) { (result) in
            XCTAssertEqual(result, expected)
        }
    }

    ///
    /// Test the ability to encode/decode a simple Dictionary<String, Enum>.
    ///
    func testEncodingDecodeOfDictionaryOfEnumValues() throws {

        enum Enum: Int, Codable { case zero, one, two, three, four, five, six }

        let input:    [String: Enum] = ["zero": Enum.zero, "one": Enum.one, "two": Enum.two, "three": Enum.three, "four": Enum.four, "five": Enum.five, "six": Enum.six]
        let expected: [String: Enum] = ["zero": Enum.zero, "one": Enum.one, "two": Enum.two, "three": Enum.three, "four": Enum.four, "five": Enum.five, "six": Enum.six]

        _testCodableRoundTrip(input: input) { (result) in
            XCTAssertEqual(result, expected)
        }
    }

    ///
    /// Test the ability to encode/decode a simple Dictionary<Enum, String>.
    ///
    func testEncodingDecodeOfDictionaryOfEnumKeys() throws {

        enum Enum: Int, Codable { case zero, one, two, three, four, five, six }

        let input:    [Enum: String] = [Enum.zero: "zero", Enum.one: "one", Enum.two: "two", Enum.three: "three", Enum.four: "four", Enum.five: "five", Enum.six: "six"]
        let expected: [Enum: String] = [Enum.zero: "zero", Enum.one: "one", Enum.two: "two", Enum.three: "three", Enum.four: "four", Enum.five: "five", Enum.six: "six"]

        _testCodableRoundTrip(input: input) { (result) in
            XCTAssertEqual(result, expected)
        }
    }

    // MARK: - Structured types

    ///
    /// Test the ability to encode/decode a basic structured type class.
    ///
    func testEncodingDecodeOfBasicClass() {

        _testCodableRoundTrip(input: BasicClass()) { (result) in
            XCTAssertEqual(result, BasicClass())
        }
    }

    ///
    /// Test the ability to encode/decode a basic structured type struct.
    ///
    func testEncodingDecodeOfBasicStruct() {

        _testCodableRoundTrip(input: BasicStruct()) { (result) in
            XCTAssertEqual(result, BasicStruct())
        }
    }

    ///
    /// Test the ability to encode/decode a more complex structured type class.
    ///
    func testEncodingDecodeOfComplexClass() {

        _testCodableRoundTrip(input: ComplexClass()) { (result) in
            XCTAssertEqual(result, ComplexClass())
        }
    }

    ///
    /// Test the ability to encode/decode a more complex structured type struct.
    ///
    func testEncodingDecodeOfComplexStruct() {

        _testCodableRoundTrip(input: ComplexStruct()) { (result) in
            XCTAssertEqual(result, ComplexStruct())
        }
    }

    ///
    /// Test the ability to encode/decode a more complex structured type class with a super class.
    ///
    func testEncodingDecodeOfComplexSubclassClass() {

        _testCodableRoundTrip(input: ComplexSubclassClass()) { (result) in
            XCTAssertEqual(result, ComplexSubclassClass())
        }
    }
}
