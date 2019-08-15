struct twitter {    let `statuses`: [statuses]
    let `search_metadata`: search_metadata
}

struct search_metadata {    let `completed_in`: Double
    let `max_id`: Int
    let `max_id_str`: String
    let `next_results`: String
    let `query`: String
    let `refresh_url`: String
    let `count`: Int
    let `since_id`: Int
    let `since_id_str`: String
}

struct statuses {    let `metadata`: metadata
    let `created_at`: String
    let `id`: Int
    let `id_str`: String
    let `text`: String
    let `source`: String
    let `truncated`: Bool
    let `in_reply_to_status_id`: 
    let `in_reply_to_status_id_str`: 
    let `in_reply_to_user_id`: Int
    let `in_reply_to_user_id_str`: String
    let `in_reply_to_screen_name`: String
    let `user`: user
    let `geo`: 
    let `coordinates`: 
    let `place`: 
    let `contributors`: 
    let `retweet_count`: Int
    let `favorite_count`: Int
    let `entities`: entities
    let `favorited`: Bool
    let `retweeted`: Bool
    let `lang`: String
}

struct entities {    let `hashtags`: []
    let `symbols`: []
    let `urls`: []
    let `user_mentions`: [user_mentions]
}

struct user_mentions {    let `screen_name`: String
    let `name`: String
    let `id`: Int
    let `id_str`: String
    let `indices`: [Int]
}

struct user {    let `id`: Int
    let `id_str`: String
    let `name`: String
    let `screen_name`: String
    let `location`: String
    let `description`: String
    let `url`: 
    let `entities`: entities
    let `protected`: Bool
    let `followers_count`: Int
    let `friends_count`: Int
    let `listed_count`: Int
    let `created_at`: String
    let `favourites_count`: Int
    let `utc_offset`: 
    let `time_zone`: 
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
    let `profile_banner_url`: String
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

struct entities {    let `description`: description
}

struct description {    let `urls`: []
}

struct metadata {    let `result_type`: String
    let `iso_language_code`: String
}

