struct entities {
    let `hashtags`: [[String]?]
    let `symbols`: [[String]?]
    let `urls`: [[String]?]
    let `user_mentions`: [[String]?]
    let `media`: [media]
}

struct media {
    let `id`: Int
    let `id_str`: String
    let `indices`: [Int]
    let `media_url`: String
    let `media_url_https`: String
    let `url`: String
    let `display_url`: String
    let `expanded_url`: String
    let `type`: String
    let `sizes`: sizes
}

struct sizes {
    let `medium`: size
    let `small`: size
    let `thumb`: size
    let `large`: size
}

struct size {
    let `w`: Int
    let `h`: Int
    let `resize`: String
}
