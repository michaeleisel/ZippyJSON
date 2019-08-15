struct github_events: Codable, Equatable {
    let `type`: String
    let `created_at`: String
    let `actor`: actor
    let `repo`: repo
    let `public`: Bool
    let `payload`: payload
    let `id`: String
}

struct payload: Codable, Equatable {
    let `commits`: [commits]?
    let `distinct_size`: Int?
    let `ref`: String?
    let `push_id`: Int?
    let `head`: String?
    let `before`: String?
    let `size`: Int?
}

struct commits: Codable, Equatable {
    let `url`: String
    let `message`: String
    let `distinct`: Bool
    let `sha`: String
    let `author`: author
}

struct author: Codable, Equatable {
    let `email`: String
    let `name`: String
}

struct repo: Codable, Equatable {
    let `url`: String
    let `id`: Int
    let `name`: String
}

struct actor: Codable, Equatable {
    let `gravatar_id`: String
    let `login`: String
    let `avatar_url`: String
    let `url`: String
    let `id`: Int
}

