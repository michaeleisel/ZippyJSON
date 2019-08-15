struct marine_ik {    let `images`: [images]
    let `geometries`: [geometries]
    let `textures`: [textures]
    let `metadata`: metadata
    let `materials`: [materials]
    let `object`: object
    let `animations`: [animations]
}

struct animations {    let `tracks`: []
    let `fps`: Int
    let `name`: String
}

struct object {    let `children`: [children]
    let `type`: String
    let `matrix`: [Int]
    let `uuid`: String
}

struct children {    let `name`: String
    let `uuid`: String
    let `matrix`: [Int]
    let `visible`: Bool
    let `type`: String
    let `material`: String
    let `castShadow`: Bool
    let `receiveShadow`: Bool
    let `geometry`: String
}

struct materials {    let `vertexColors`: Int
    let `name`: String
    let `type`: String
    let `uuid`: String
    let `blending`: String
    let `map`: String
    let `transparent`: Bool
    let `depthTest`: Bool
    let `color`: Int
    let `shininess`: Int
    let `emissive`: Int
    let `depthWrite`: Bool
    let `specular`: Int
}

struct metadata {    let `sourceFile`: String
    let `generator`: String
    let `type`: String
    let `version`: Double
}

struct textures {    let `repeat`: [Int]
    let `wrap`: [Int]
    let `anisotropy`: Int
    let `image`: String
    let `name`: String
    let `mapping`: Int
    let `minFilter`: Int
    let `uuid`: String
    let `magFilter`: Int
}

struct geometries {    let `type`: String
    let `uuid`: String
    let `data`: data
}

struct data {    let `uvs`: [[Double]]
    let `animations`: [animations]
    let `vertices`: [Double]
    let `metadata`: metadata
    let `name`: String
    let `skinWeights`: [Double]
    let `skinIndices`: [Int]
    let `influencesPerVertex`: Int
    let `normals`: [Double]
    let `bones`: [bones]
    let `faces`: [Int]
}

struct bones {    let `parent`: Int
    let `pos`: [Int]
    let `rotq`: [Int]
    let `scl`: [Int]
    let `name`: String
}

struct metadata {    let `uvs`: Int
    let `version`: Int
    let `faces`: Int
    let `generator`: String
    let `normals`: Int
    let `bones`: Int
    let `vertices`: Int
}

struct animations {    let `hierarchy`: [hierarchy]
    let `length`: Double
    let `fps`: Int
    let `name`: String
}

struct hierarchy {    let `parent`: Int
    let `keys`: [keys]
}

struct keys {    let `pos`: [Int]
    let `time`: Int
    let `scl`: [Int]
    let `rot`: [Int]
}

struct images {    let `url`: String
    let `uuid`: String
    let `name`: String
}

