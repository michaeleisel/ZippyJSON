struct apache_builds: Codable, Equatable {
    let `assignedLabels`: [assignedLabels]
    let `mode`: String
    let `nodeDescription`: String
    let `nodeName`: String
    let `numExecutors`: Int
    let `description`: String
    let `jobs`: [jobs]
    let `overallLoad`: overallLoad
    let `primaryView`: primaryView
    let `quietingDown`: Bool
    let `slaveAgentPort`: Int
    let `unlabeledLoad`: unlabeledLoad
    let `useCrumbs`: Bool
    let `useSecurity`: Bool
    let `views`: [views]
}

struct views: Codable, Equatable {
    let `name`: String
    let `url`: String
}

struct unlabeledLoad: Codable, Equatable {
}

struct primaryView: Codable, Equatable {
    let `name`: String
    let `url`: String
}

struct overallLoad: Codable, Equatable {
}

struct jobs: Codable, Equatable {
    let `name`: String
    let `url`: String
    let `color`: String
}

struct assignedLabels: Codable, Equatable {
}

