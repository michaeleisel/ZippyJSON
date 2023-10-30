// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Welcome
struct Twitter: Codable, Equatable {
    let statuses: [Status]
    let searchMetadata: SearchMetadata

    enum CodingKeys: String, CodingKey {
        case statuses = "statuses"
        case searchMetadata = "search_metadata"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - SearchMetadata
struct SearchMetadata: Codable, Equatable {
    let completedIn: Double
    let maxid: Double
    let maxidStr: String
    let nextResults: String
    let query: String
    let refreshurl: String
    let count: Int
    let sinceid: Int
    let sinceidStr: String

    enum CodingKeys: String, CodingKey {
        case completedIn = "completed_in"
        case maxid = "max_id"
        case maxidStr = "max_id_str"
        case nextResults = "next_results"
        case query = "query"
        case refreshurl = "refresh_url"
        case count = "count"
        case sinceid = "since_id"
        case sinceidStr = "since_id_str"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Status
struct Status: Codable, Equatable {
    let metadata: Metadata
    let createdAt: String
    let id: Double
    let idStr: String
    let text: String
    let source: String
    let truncated: Bool
    let inReplyToStatusid: Double?
    let inReplyToStatusidStr: String?
    let inReplyToUserid: Int?
    let inReplyToUseridStr: String?
    let inReplyToScreenName: String?
    let user: User
    //let geo: NSNull?
    // let coordinates: NSNull?
    // let place: NSNull?
    // let contributors: NSNull?
    let retweetCount: Int
    let favoriteCount: Int
    let entities: StatusEntities
    let favorited: Bool
    let retweeted: Bool
    let lang: String
    // let retweetedStatus: Status?
    let possiblySensitive: Bool?

    enum CodingKeys: String, CodingKey {
        case metadata = "metadata"
        case createdAt = "created_at"
        case id = "id"
        case idStr = "id_str"
        case text = "text"
        case source = "source"
        case truncated = "truncated"
        case inReplyToStatusid = "in_reply_to_status_id"
        case inReplyToStatusidStr = "in_reply_to_status_id_str"
        case inReplyToUserid = "in_reply_to_user_id"
        case inReplyToUseridStr = "in_reply_to_user_id_str"
        case inReplyToScreenName = "in_reply_to_screen_name"
        case user = "user"
        // case geo = "geo"
        // case coordinates = "coordinates"
        // case place = "place"
        // case contributors = "contributors"
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
        case entities = "entities"
        case favorited = "favorited"
        case retweeted = "retweeted"
        case lang = "lang"
        // case retweetedStatus = "retweeted_status"
        case possiblySensitive = "possibly_sensitive"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - StatusEntities
struct StatusEntities: Codable, Equatable {
    let hashtags: [Hashtag]
    // let symbols: NSNull
    let urls: [URLElement]
    let userMentions: [UserMention]
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case hashtags = "hashtags"
        // case symbols = "symbols"
        case urls = "urls"
        case userMentions = "user_mentions"
        case media = "media"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Hashtag
struct Hashtag: Codable, Equatable {
    let text: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Media
struct Media: Codable, Equatable {
    let id: Double
    let idStr: String
    let indices: [Int]
    let mediaurl: String
    let mediaurlhttps: String
    let url: String
    let displayurl: String
    let expandedurl: String
    let type: String
    let sizes: Sizes
    let sourceStatusid: Double?
    let sourceStatusidStr: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
        case mediaurl = "media_url"
        case mediaurlhttps = "media_url_https"
        case url = "url"
        case displayurl = "display_url"
        case expandedurl = "expanded_url"
        case type = "type"
        case sizes = "sizes"
        case sourceStatusid = "source_status_id"
        case sourceStatusidStr = "source_status_id_str"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Sizes
struct Sizes: Codable, Equatable {
    let medium: Large
    let small: Large
    let thumb: Large
    let large: Large

    enum CodingKeys: String, CodingKey {
        case medium = "medium"
        case small = "small"
        case thumb = "thumb"
        case large = "large"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Large
struct Large: Codable, Equatable {
    let w: Int
    let h: Int
    let resize: String

    enum CodingKeys: String, CodingKey {
        case w = "w"
        case h = "h"
        case resize = "resize"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - URLElement
struct URLElement: Codable, Equatable {
    let url: String
    let expandedurl: String
    let displayurl: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case expandedurl = "expanded_url"
        case displayurl = "display_url"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - UserMention
struct UserMention: Codable, Equatable {
    let screenName: String
    let name: String
    let id: Int
    let idStr: String
    let indices: [Int]

    enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case name = "name"
        case id = "id"
        case idStr = "id_str"
        case indices = "indices"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Metadata
struct Metadata: Codable, Equatable {
    let resultType: String
    let isoLanguageCode: String

    enum CodingKeys: String, CodingKey {
        case resultType = "result_type"
        case isoLanguageCode = "iso_language_code"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - User
struct User: Codable, Equatable {
    let id: Int
    let idStr: String
    let name: String
    let screenName: String
    let location: String
    let userDescription: String
    let url: String?
    let entities: UserEntities
    let protected: Bool
    let followersCount: Int
    let friendsCount: Int
    let listedCount: Int
    let createdAt: String
    let favouritesCount: Int
    let utcOffset: Int?
    let timeZone: String?
    let geoEnabled: Bool
    let verified: Bool
    let statusesCount: Int
    let lang: String
    let contributorsEnabled: Bool
    let isTranslator: Bool
    let isTranslationEnabled: Bool
    let profileBackgroundColor: String
    let profileBackgroundImageurl: String
    let profileBackgroundImageurlhttps: String
    let profileBackgroundTile: Bool
    let profileImageurl: String
    let profileImageurlhttps: String
    let profileBannerurl: String?
    let profileLinkColor: String
    let profileSidebarBorderColor: String
    let profileSidebarFillColor: String
    let profileTextColor: String
    let profileUseBackgroundImage: Bool
    let defaultProfile: Bool
    let defaultProfileImage: Bool
    let following: Bool
    let followRequestSent: Bool
    let notifications: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case idStr = "id_str"
        case name = "name"
        case screenName = "screen_name"
        case location = "location"
        case userDescription = "description"
        case url = "url"
        case entities = "entities"
        case protected = "protected"
        case followersCount = "followers_count"
        case friendsCount = "friends_count"
        case listedCount = "listed_count"
        case createdAt = "created_at"
        case favouritesCount = "favourites_count"
        case utcOffset = "utc_offset"
        case timeZone = "time_zone"
        case geoEnabled = "geo_enabled"
        case verified = "verified"
        case statusesCount = "statuses_count"
        case lang = "lang"
        case contributorsEnabled = "contributors_enabled"
        case isTranslator = "is_translator"
        case isTranslationEnabled = "is_translation_enabled"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageurl = "profile_background_image_url"
        case profileBackgroundImageurlhttps = "profile_background_image_url_https"
        case profileBackgroundTile = "profile_background_tile"
        case profileImageurl = "profile_image_url"
        case profileImageurlhttps = "profile_image_url_https"
        case profileBannerurl = "profile_banner_url"
        case profileLinkColor = "profile_link_color"
        case profileSidebarBorderColor = "profile_sidebar_border_color"
        case profileSidebarFillColor = "profile_sidebar_fill_color"
        case profileTextColor = "profile_text_color"
        case profileUseBackgroundImage = "profile_use_background_image"
        case defaultProfile = "default_profile"
        case defaultProfileImage = "default_profile_image"
        case following = "following"
        case followRequestSent = "follow_request_sent"
        case notifications = "notifications"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - UserEntities
struct UserEntities: Codable, Equatable {
    let entitiesDescription: Description
    let url: Description?

    enum CodingKeys: String, CodingKey {
        case entitiesDescription = "description"
        case url = "url"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Description
struct Description: Codable, Equatable {
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case urls = "urls"
    }
}
