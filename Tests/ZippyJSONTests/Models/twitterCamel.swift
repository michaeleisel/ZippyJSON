// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

/*import Foundation

// MARK: - Welcome
struct TwitterCamel: Codable, Equatable {
    let statuses: [Status]
    let searchMetadata: SearchMetadata
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
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Description
struct Description: Codable, Equatable {
    let urls: [URLElement]
}*/
