struct canada {    let `type`: String
    let `features`: [features]
}

struct features {    let `type`: String
    let `properties`: properties
    let `geometry`: geometry
}

struct geometry {    let `type`: String
    let `coordinates`: [[[Double]]]
}

struct properties {    let `name`: String
}

