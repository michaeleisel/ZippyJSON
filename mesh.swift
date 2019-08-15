struct mesh {    let `batches`: [batches]
    let `morphTargets`: morphTargets
    let `positions`: [Double]
    let `tex0`: [Double]
    let `colors`: [Int]
    let `influences`: [[Double]]
    let `normals`: [Double]
    let `indices`: [Int]
}

struct morphTargets {}

struct batches {    let `indexRange`: [Int]
    let `vertexRange`: [Int]
    let `usedBones`: [Int]
}

