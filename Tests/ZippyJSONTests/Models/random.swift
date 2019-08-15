struct random: Codable, Equatable {
    let `id`: Int
    let `jsonrpc`: String
    let `total`: Int
    let `result`: [result]
}

struct result: Codable, Equatable {
    let `id`: Int
    let `avatar`: String
    let `age`: Int
    let `admin`: Bool
    let `name`: String
    let `company`: String
    let `phone`: String
    let `email`: String
    let `birthDate`: String
    let `friends`: [friends]
    let `field`: String
}

struct friends: Codable, Equatable {
    let `id`: Int
    let `name`: String
    let `phone`: String
}

