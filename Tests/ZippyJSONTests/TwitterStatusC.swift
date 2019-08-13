//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation

struct TwitterStatusC: Codable, Equatable {
    //let metadata: [String: Any]
    let createdAt: String?//Date?
    let id: ID
    let idStr: String
    let text: String
    let source: String
    let truncated: Bool
    let inReplyToStatusId: ID?//
    let inReplyToStatusIdStr: String?//
    let inReplyToUserId: ID?//
    let inReplyToUserIdStr: String?//
    let inReplyToScreenName: String?
    let user: TwitterUserC
    let geo: String?
    let coordinates: String?
    let contributors: [TwitterUserC]?
    let retweetCount: Int
    let favoriteCount: Int
    //let entities
    let favorited: Bool
    let retweeted: Bool
    let lang: String
}
