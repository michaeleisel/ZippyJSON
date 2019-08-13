//Copyright (c) 2018 Michael Eisel. All rights reserved.

struct TwitterPayload: Codable, Equatable {
    let statuses: [TwitterStatus]
}
