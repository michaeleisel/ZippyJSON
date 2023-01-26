///
///  BinaryDecoderNegativeTests.swift
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
///  Created by Tony Stone on 10/23/17.
///
import XCTest

///
/// Note: This file contains public interface tests so do not use @testable.
///
import ZippyJSON

///
/// `BinaryDecoderNegativeTests`
///
class BinaryDecoderNegativeTests: XCTestCase {

    ///
    /// Test to that `_BinaryDecoder.container(forKey:)` func throws a `DecoderError.typeMismatch` error if it encounters a container type other than `KeyedDecodingContainer`.
    ///
    func testContainerWhenTypeMismatch() {

        struct InputType: Codable {
            var value: String
            init(value: String) { self.value = value }

            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                self.value = try container.decode(String.self)
            }
            func encode(to encoder: Encoder) throws {
                var container = encoder.unkeyedContainer()
                try container.encode(self.value)
            }
        }

        struct ExpectedType: Codable {
            var value: String
            init(value: String) { self.value = value }
            enum CodingKeys: CodingKey { case value }
        }
        _testDecodeTypeMismatch(input: InputType(value: "Test String"), expected: (type: ExpectedType.self, errorType: KeyedDecodingContainer<ExpectedType.CodingKeys>.self, codingPath: [], description: "Expected to decode KeyedDecodingContainer<CodingKeys> but found UnkeyedDecodingContainer instead."))
    }

    ///
    /// Test to that `_BinaryDecoder.unkeydContainer()` func throws a `DecoderError.typeMismatch` error if it encounters a container type other than `UnkeyedDecodingContainer`.
    ///
    func testUnkeyedContainerWhenTypeMismatch() {

        struct InputType: Codable {
            var value: String
            init(value: String) { self.value = value }
            enum CodingKeys: CodingKey { case value }
        }

        struct ExpectedType: Codable {
            var value: String
            init(value: String) { self.value = value }

            enum CodingKeys: CodingKey { case value }

            init(from decoder: Decoder) throws {
                var container = try decoder.unkeyedContainer()
                self.value = try container.decode(String.self)
            }
            func encode(to encoder: Encoder) throws {
                var container = encoder.unkeyedContainer()
                try container.encode(self.value)
            }
        }
        _testDecodeTypeMismatch(input: InputType(value: "Test String"), expected: (type: ExpectedType.self, errorType: UnkeyedDecodingContainer.self, codingPath: [], description: "Expected to decode UnkeyedDecodingContainer but found KeyedDecodingContainer<CodingKeys> instead."))
    }

    ///
    /// Test to that `_BinaryDecoder.singleValueContainer()` func throws a `DecoderError.typeMismatch` error if it encounters a container type other than `SingleValueDecodingContainer`.
    ///
    func testSingleValueContainerWhenTypeMismatch() {

        struct InputType: Codable {
            var value: String
            init(value: String) { self.value = value }
            enum CodingKeys: CodingKey { case value }
        }

        struct ExpectedType: Codable {
            var value: String
            init(value: String) { self.value = value }

            enum CodingKeys: CodingKey { case value }

            init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                self.value = try container.decode(String.self)
            }
            func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(self.value)
            }
        }
        _testDecodeTypeMismatch(input: InputType(value: "Test String"), expected: (type: ExpectedType.self, errorType: String.self, codingPath: [], description: "Expected to decode String but found KeyedDecodingContainer<CodingKeys> instead."))
    }
}
