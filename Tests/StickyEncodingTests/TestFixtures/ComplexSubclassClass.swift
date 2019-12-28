///
///  ComplexSubclassType.swift
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
import Swift

///
/// Type: `ComplexSubclassClass`
///
/// Test class which represents a complex subclass class used by
/// a developer using the library.
///
public class ComplexSubclassClass: ComplexClass {
    public var subclassStringVar: String

    public init(subclassStringVar: String = "", boolVar: Bool = false, intVar: Int = 0, doubleVar: Double = 0.00, stringVar: String = "", optionalStringVar: String? = nil, objectVar: BasicClass = BasicClass(), objectArrayVar: [BasicClass] = []) {
        self.subclassStringVar = subclassStringVar

        super.init(boolVar: boolVar, intVar: intVar, doubleVar:  doubleVar, stringVar: stringVar, optionalStringVar: optionalStringVar, objectVar: objectVar, objectArrayVar: objectArrayVar)
    }

    // MARK: - `Codable` conformance

    enum CodingKeys: CodingKey {
        case subclassStringVar
    }

    ///
    /// - Note: On subclasses, Codable init and encode methods are auto generated so must be created explicitly
    ///
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.subclassStringVar = try container.decode(String.self, forKey: .subclassStringVar)

        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.subclassStringVar, forKey: .subclassStringVar)

        try super.encode(to: encoder)
    }

    // MARK: - `Equatable` conformance for testing/debugging.

    public override func equals<T>(_ other: T) -> Bool where T: ComplexSubclassClass {

        return super.equals(other) &&
               self.subclassStringVar == other.subclassStringVar
    }

    // MARK: - `CustomStringConvertible` conformance for testing/debugging.

    public override var description: String {
        return "\(String(describing: type(of: self)))(subclassStringVar: \"\(self.subclassStringVar)\", boolVar: \(self.boolVar), intVar: \(self.intVar), doubleVar: \(self.doubleVar), stringVar: \"\(self.stringVar)\", optionalStringVar: \"\(self.optionalStringVar ?? "nil")\", objectVar: \(self.objectVar), objectArrayVar: \(self.objectArrayVar))"
    }
}
