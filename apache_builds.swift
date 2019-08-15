struct apache_builds {    let `assignedLabels`: [assignedLabels]
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

struct views {    let `name`: String
    let `url`: String
}

struct unlabeledLoad {}

struct primaryView {    let `name`: String
    let `url`: String
}

struct overallLoad {}

struct jobs {    let `name`: String
    let `url`: String
    let `color`: String
}

struct assignedLabels {}

