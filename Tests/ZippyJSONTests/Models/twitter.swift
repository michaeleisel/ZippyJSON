struct twitter: Codable, Equatable {
    let `statuses`: [statuses]
    let `search_metadata`: search_metadata
}

struct search_metadata: Codable, Equatable {
    let `completed_in`: Double
    let `max_id`: Int
    let `max_id_str`: String
    let `next_results`: String
    let `query`: String
    let `refresh_url`: String
    let `count`: Int
    let `since_id`: Int
    let `since_id_str`: String
}

struct statuses: Codable, Equatable {
    let `metadata`: metadata
    let `created_at`: String
    let `id`: Int
    let `id_str`: String
    let `text`: String
    let `source`: String
    let `truncated`: Bool
    let `in_reply_to_status_id`: Int?
    let `in_reply_to_status_id_str`: String?
    let `in_reply_to_user_id`: Int?
    let `in_reply_to_user_id_str`: String?
    let `in_reply_to_screen_name`: String?
    let `user`: user
    let `geo`: String?
    let `coordinates`: String?
    let `place`: String?
    let `contributors`: [String]?
    let `retweet_count`: Int
    let `favorite_count`: Int
    let `entities`: entities
    let `favorited`: Bool
    let `retweeted`: Bool
    let `lang`: String
}

struct user_mentions: Codable, Equatable {
    let `screen_name`: String
    let `name`: String
    let `id`: Int
    let `id_str`: String
    let `indices`: [Int]
}

struct user: Codable, Equatable {
    let `id`: Int
    let `id_str`: String
    let `name`: String
    let `screen_name`: String
    let `location`: String
    let `description`: String
    let `url`: String?
    let `entities`: user_entities
    let `protected`: Bool
    let `followers_count`: Int
    let `friends_count`: Int
    let `listed_count`: Int
    let `created_at`: String
    let `favourites_count`: Int
    let `utc_offset`: Int?
    let `time_zone`: String?
    let `geo_enabled`: Bool
    let `verified`: Bool
    let `statuses_count`: Int
    let `lang`: String
    let `contributors_enabled`: Bool
    let `is_translator`: Bool
    let `is_translation_enabled`: Bool
    let `profile_background_color`: String
    let `profile_background_image_url`: String
    let `profile_background_image_url_https`: String
    let `profile_background_tile`: Bool
    let `profile_image_url`: String
    let `profile_image_url_https`: String
    let `profile_banner_url`: String?
    let `profile_link_color`: String
    let `profile_sidebar_border_color`: String
    let `profile_sidebar_fill_color`: String
    let `profile_text_color`: String
    let `profile_use_background_image`: Bool
    let `default_profile`: Bool
    let `default_profile_image`: Bool
    let `following`: Bool
    let `follow_request_sent`: Bool
    let `notifications`: Bool
}

struct user_entities: Codable, Equatable {
    let `description`: description
}

struct description: Codable, Equatable {
    let `urls`: [description_url]?
}

struct metadata: Codable, Equatable {
    let `result_type`: String
    let `iso_language_code`: String
}

struct hashtag: Codable, Equatable {
    let text: String
    let indices: [Int]
}

struct entities: Codable, Equatable {
    let `hashtags`: [hashtag]
    let `symbols`: [[String]?]
    let `urls`: [description_url]
    let `user_mentions`: [user_mentions]
    let `media`: [media]?
}

struct description_url: Codable, Equatable {
    let `url`: String
    let `indices`: [Int]
    let `display_url`: String
    let `expanded_url`: String
}

struct media: Codable, Equatable {
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

struct sizes: Codable, Equatable {
    let `medium`: size
    let `small`: size
    let `thumb`: size
    let `large`: size
}

struct size: Codable, Equatable {
    let `w`: Int
    let `h`: Int
    let `resize`: String
}

