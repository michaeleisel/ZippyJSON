///
///  CodableType.swift
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
///  Created by Tony Stone on 11/1/17.
///
///
import Swift

///
/// Special type created to test custom objects that are Codable.
///
internal struct CodableType: Codable, Equatable {
    let value: Int
    init(_ value: Int) { self.value = value }

    enum CodingKeys: CodingKey { case value }

    public static func == (lhs: CodableType, rhs: CodableType) -> Bool {
        return lhs.value == rhs.value
    }
}
