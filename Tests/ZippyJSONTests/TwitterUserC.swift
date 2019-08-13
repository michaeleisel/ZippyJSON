//Copyright (c) 2018 Michael Eisel. All rights reserved.

struct TwitterEntitiesDescriptionC: Codable, Equatable {
    //let urls: [String]
}

struct TwitterEntitiesC: Codable, Equatable {
    let description: TwitterEntitiesDescriptionC
}

struct TwitterUserC: Codable, Equatable {
    let id: ID
    let idStr: String
    let name: String
    let screenName: String
    let location: String
    let description: String
    let url: String?
    let entities: TwitterEntitiesC
    let protected: Bool
    let followersCount: Int
    let friendsCount: Int
    let listedCount: Int
    let createdAt: String
    let favouritesCount: Int
    let utcOffset: Int?
    let timeZone: String?
    let verified: Bool
    let statusesCount: Int
    let lang: String
    let contributorsEnabled: Bool
    let isTranslator: Bool
    let isTranslationEnabled: Bool
    let profileBackgroundColor: String
    let profileBackgroundImageUrl: String
    let profileBackgroundImageUrlHttps: String
    let profileBackgroundTile: Bool
    let profileImageUrl: String
    let profileBannerUrl: String?
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

