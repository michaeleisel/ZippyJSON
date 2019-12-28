///
///  BinaryEncodingUserInfoTests.swift
///
///  Copyright 2019 Tony Stone
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
///  Created by Tony Stone on 2/17/19.
///
import XCTest

///
/// Note: This file contains public interface tests so do not use @testable.
///
import ZippyJSON

let testUserInfoKey: CodingUserInfoKey = CodingUserInfoKey(rawValue: "TestUserInfoKey")!
let inputValue = 123
let inputUserInfo: [CodingUserInfoKey : Any] = [testUserInfoKey: inputValue]


///
class BinaryEncodingUserInfoTests: XCTestCase {

    func testUserInfoForDecoder() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            required
            init(from decoder: Decoder) throws {
                /// Satisfy the constructor by assigning a value.
                self.value = try decoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( decoder.userInfo.count, 1)
                XCTAssertEqual((decoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( encoder.userInfo.count, 1)
                XCTAssertEqual((encoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForUnkeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            required
            init(from decoder: Decoder) throws {
                var rootContainer = try decoder.unkeyedContainer()
                let superDecoder  = try rootContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer = encoder.unkeyedContainer()
                let superEncoder  = rootContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForUnkeyedNestedUnkeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            required
            init(from decoder: Decoder) throws {
                var rootContainer   = try decoder.unkeyedContainer()
                var nestedContainer = try rootContainer.nestedUnkeyedContainer()
                let superDecoder    = try nestedContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer   = encoder.unkeyedContainer()
                var nestedContainer = rootContainer.nestedUnkeyedContainer()
                let superEncoder    = nestedContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForUnkeyedNestedKeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            enum CodingKeys: CodingKey {
                case value
            }

            required
            init(from decoder: Decoder) throws {
                var rootContainer   = try decoder.unkeyedContainer()
                let nestedContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.self)
                let superDecoder    = try nestedContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer   = encoder.unkeyedContainer()
                var nestedContainer = rootContainer.nestedContainer(keyedBy: CodingKeys.self)
                let superEncoder    = nestedContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForKeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            enum CodingKeys: CodingKey {
                case value
            }

            required
            init(from decoder: Decoder) throws {
                let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
                let superDecoder  = try rootContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer = encoder.container(keyedBy: CodingKeys.self)
                let superEncoder  = rootContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForKeyedNestedUnkeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            enum CodingKeys: CodingKey {
                case value
            }

            required
            init(from decoder: Decoder) throws {
                let rootContainer   = try decoder.container(keyedBy: CodingKeys.self)
                var nestedContainer = try rootContainer.nestedUnkeyedContainer(forKey: CodingKeys.value)
                let superDecoder    = try nestedContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer   = encoder.container(keyedBy: CodingKeys.self)
                var nestedContainer = rootContainer.nestedUnkeyedContainer(forKey: CodingKeys.value)
                let superEncoder    = nestedContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }

    func testUserInfoForKeyedNestedKeyedContainer() throws {

        class InputType: Codable {
            var value: Bool
            init(value: Bool) { self.value = value }

            enum CodingKeys: CodingKey {
                case value
            }

            required
            init(from decoder: Decoder) throws {
                let rootContainer   = try decoder.container(keyedBy: CodingKeys.self)
                let nestedContainer = try rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: CodingKeys.value)
                let superDecoder    = try nestedContainer.superDecoder()

                /// Satisfy the constructor by assigning a value.
                self.value = try superDecoder.singleValueContainer().decode(Bool.self)

                /// Test the decoder itself.
                XCTAssertEqual( superDecoder.userInfo.count, 1)
                XCTAssertEqual((superDecoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }

            func encode(to encoder: Encoder) throws {
                var rootContainer   = encoder.container(keyedBy: CodingKeys.self)
                var nestedContainer = rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: CodingKeys.value)
                let superEncoder    = nestedContainer.superEncoder()

                var container = superEncoder.singleValueContainer(); try container.encode(self.value)

                /// Test the encoder itself.
                XCTAssertEqual( superEncoder.userInfo.count, 1)
                XCTAssertEqual((superEncoder.userInfo[testUserInfoKey] as? Int ?? 0), inputValue)
            }
        }
        /// Execute the tests
        let bytes = try JSONEncoder().encode(InputType(value: true))
        _ = try ZippyJSONDecoder().decode(InputType.self, from: bytes)
    }
}
