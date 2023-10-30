///
///  DocumentationExampleTests.swift
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
///  Created by Tony Stone on 2/13/19.
///
import XCTest

import ZippyJSON

class DocumentationExampleTests: XCTestCase {

    let encoder = JSONEncoder()
    let decoder = ZippyJSONDecoder()

    func testBinaryEncoderExample2() throws {

        /// Actual code in example.
        ///
        struct Employee: Codable {
            let first: String
            let last: String
            let employeeNumber: Int
        }

        let employee = Employee(first: "John", last: "Doe", employeeNumber: 2345643)

        let _ = try encoder.encode(employee)
    }

    func testBinaryDecoderExample1() throws {

        struct Employee: Codable {
            let first: String
            let last: String
            let employeeNumber: Int
        }

        let bytes = try encoder.encode(Employee(first: "John", last: "Doe", employeeNumber: 2345643))

        /// Actual code in example.
        ///
        let _ = try decoder.decode(Employee.self, from: bytes)
    }

    func testEncodedDataExample1() throws {

        /// Code from previous example used as boiler plate for this example.
        ///
        struct Employee: Codable {
            let first: String
            let last: String
            let employeeNumber: Int
        }

        let employee = Employee(first: "John", last: "Doe", employeeNumber: 2345643)

        /// Actual code in example.
        ///
        let bytes = try encoder.encode(employee)

        FileManager.default.createFile(atPath: "employee.bin", contents: Data(bytes))
    }

    func testArrayConstructionExample() throws {

        let encoder     = JSONEncoder()
        let bytes = try encoder.encode(["String 1", "String 2"])

        let _ = Array(bytes)
    }

    func testDataConstructionExample() throws {

        let encoder     = JSONEncoder()
        let bytes = try encoder.encode(["String 1", "String 2"])

        let _ = Data(bytes)
    }
}
