//Copyright (c) 2018 Michael Eisel. All rights reserved.

struct TwitterEntitiesDescription: Codable, Equatable {
    //let urls: [String]
}

struct TwitterEntities: Codable, Equatable {
    let description: TwitterEntitiesDescription
}

struct TwitterUser: Codable, Equatable {
    let id: ID
    let id_str: String
    let name: String
    let screen_name: String
    let location: String
    let description: String
    let url: String?
    let entities: TwitterEntities
    let protected: Bool
    let followers_count: Int
    let friends_count: Int
    let listed_count: Int
    let created_at: String
    let favourites_count: Int
    let utc_offset: Int?
    let time_zone: String?
    let verified: Bool
    let statuses_count: Int
    let lang: String
    let contributors_enabled: Bool
    let is_translator: Bool
    let is_translation_enabled: Bool
    let profile_background_color: String
    let profile_background_image_url: String
    let profile_background_image_url_https: String
    let profile_background_tile: Bool
    let profile_image_url: String
    let profile_banner_url: String?
    let profile_link_color: String
    let profile_sidebar_border_color: String
    let profile_sidebar_fill_color: String
    let profile_text_color: String
    let profile_use_background_image: Bool
    let default_profile: Bool
    let default_profile_image: Bool
    let following: Bool
    let follow_request_sent: Bool
    let notifications: Bool
}

