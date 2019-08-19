// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Welcome
public struct ApacheBuilds: Codable, Equatable {
    let assignedLabels: [OverallLoad]
    let mode: String
    let nodeDescription: String
    let nodeName: String
    let numExecutors: Int
    let welcomeDescription: String
    let jobs: [Job]
    let overallLoad: OverallLoad
    let primaryView: View
    let quietingDown: Bool
    let slaveAgentPort: Int
    let unlabeledLoad: OverallLoad
    let useCrumbs: Bool
    let useSecurity: Bool
    let views: [View]

    enum CodingKeys: String, CodingKey {
        case assignedLabels = "assignedLabels"
        case mode = "mode"
        case nodeDescription = "nodeDescription"
        case nodeName = "nodeName"
        case numExecutors = "numExecutors"
        case welcomeDescription = "description"
        case jobs = "jobs"
        case overallLoad = "overallLoad"
        case primaryView = "primaryView"
        case quietingDown = "quietingDown"
        case slaveAgentPort = "slaveAgentPort"
        case unlabeledLoad = "unlabeledLoad"
        case useCrumbs = "useCrumbs"
        case useSecurity = "useSecurity"
        case views = "views"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - OverallLoad
struct OverallLoad: Codable, Equatable {
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Job
struct Job: Codable, Equatable {
    let name: String
    let url: String
    let color: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case color = "color"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - View
struct View: Codable, Equatable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

