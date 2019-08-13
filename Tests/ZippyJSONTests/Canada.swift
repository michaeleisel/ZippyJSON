//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation

struct Canada: Codable, Equatable {
    let type: String
    let features: [Feature]
}

struct Feature: Codable, Equatable {
    let type: String
    let properties: Properties
    let geometry: Geometry
}

struct Properties: Codable, Equatable {
    let name: String
}

struct Geometry: Codable, Equatable {
    let type: String
    let coordinates: [[Coordinates]]
}

struct Coordinates: Codable, Equatable {
    let d1: Double
    let d2: Double

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        d1 = try container.decode(Double.self)
        d2 = try container.decode(Double.self)
    }
}
