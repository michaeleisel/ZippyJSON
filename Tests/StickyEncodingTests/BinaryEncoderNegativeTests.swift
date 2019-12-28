///
///  BinaryEncoderNegativeTests.swift
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
/// Negative tests for `BinaryEncoder` when a user object throws an error.
///
class BinaryEncoderUserObjectNegativeTests: XCTestCase {

    ///
    /// Test the ability to rethrow an error occurring in the user's code during encoding.
    ///
    func testEncodeWithUserObjectThrowing() {

        enum Error: Swift.Error { case testError(String) }

        struct InputType: Codable {
            var value: Int
            init(value: Int) { self.value = value }

            enum CodingKeys: CodingKey { case value }

            init(from decoder: Decoder) throws {
                throw Error.testError("Test Error")
            }
            func encode(to encoder: Encoder) throws {
                throw Error.testError("Test Error")
            }
        }

        let encoder = JSONEncoder()

        XCTAssertThrowsError(try encoder.encode(InputType(value: 1))) { (error) in
            switch error {
            case Error.testError(let message):
                XCTAssertEqual(message, "Test Error")

            default: XCTFail("Incorrect error returned: \(error)")
            }
        }
    }
}

