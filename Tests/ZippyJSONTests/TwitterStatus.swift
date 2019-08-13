//Copyright (c) 2018 Michael Eisel. All rights reserved.

import Foundation

typealias ID = UInt

struct TwitterStatus: Codable, Equatable {
    //let metadata: [String: Any]
    let created_at: String?//Date?
    let id: ID
    let id_str: String
    let text: String
    let source: String
    let truncated: Bool
    let in_reply_to_status_id: ID?//
    let in_reply_to_status_id_str: String?//
    let in_reply_to_user_id: ID?//
    let in_reply_to_user_id_str: String?//
    let in_reply_to_screen_name: String?
    let user: TwitterUser
    let geo: String?
    let coordinates: String?
    let contributors: [TwitterUser]?
    let retweet_count: Int
    let favorite_count: Int
    //let entities
    let favorited: Bool
    let retweeted: Bool
    let lang: String
}
