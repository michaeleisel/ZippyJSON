struct mesh: Codable, Equatable {
    let `batches`: [batches]
    let `morphTargets`: morphTargets
    let `positions`: [Double]
    let `tex0`: [Double]
    let `colors`: [Int]
    let `influences`: [[Double]]
    let `normals`: [Double]
    let `indices`: [Int]
}

struct morphTargets: Codable, Equatable {
}

struct batches: Codable, Equatable {
    let `indexRange`: [Int]
    let `vertexRange`: [Int]
    let `usedBones`: [Int]
}

