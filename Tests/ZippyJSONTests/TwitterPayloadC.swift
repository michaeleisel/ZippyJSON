//Copyright (c) 2018 Michael Eisel. All rights reserved.

struct TwitterPayloadC: Codable, Equatable {
    let statuses: [TwitterStatusC]
}
