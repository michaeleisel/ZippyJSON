// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ghWelcome = try? newJSONDecoder().decode(ghWelcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - ghWelcomeElement
struct ghWelcomeElement: Codable, Equatable {
    let type: String
    let createdAt: Date
    let actor: ghActor
    let repo: ghRepo
    let welcomePublic: Bool
    let payload: ghPayload
    let id: String
    let org: ghActor?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case createdAt = "created_at"
        case actor = "actor"
        case repo = "repo"
        case welcomePublic = "public"
        case payload = "payload"
        case id = "id"
        case org = "org"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghActor
struct ghActor: Codable, Equatable {
    let gravatarid: String
    let login: String
    let avatarurl: String
    let url: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case gravatarid = "gravatar_id"
        case login = "login"
        case avatarurl = "avatar_url"
        case url = "url"
        case id = "id"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghPayload
struct ghPayload: Codable, Equatable {
    let commits: [ghCommit]?
    let distinctSize: Int?
    let ref: String?
    let pushid: Int?
    let head: String?
    let before: String?
    let size: Int?
    let payloadDescription: String?
    let masterBranch: String?
    let refType: String?
    let forkee: ghForkee?
    let action: String?
    let issue: ghIssue?
    let comment: ghComment?
    let pages: [ghPage]?

    enum CodingKeys: String, CodingKey {
        case commits = "commits"
        case distinctSize = "distinct_size"
        case ref = "ref"
        case pushid = "push_id"
        case head = "head"
        case before = "before"
        case size = "size"
        case payloadDescription = "description"
        case masterBranch = "master_branch"
        case refType = "ref_type"
        case forkee = "forkee"
        case action = "action"
        case issue = "issue"
        case comment = "comment"
        case pages = "pages"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghComment
struct ghComment: Codable, Equatable {
    let user: ghUser
    let url: String
    let issueurl: String
    let createdAt: Date
    let body: String
    let updatedAt: Date
    let id: Int

    enum CodingKeys: String, CodingKey {
        case user = "user"
        case url = "url"
        case issueurl = "issue_url"
        case createdAt = "created_at"
        case body = "body"
        case updatedAt = "updated_at"
        case id = "id"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghUser
struct ghUser: Codable, Equatable {
    let url: String
    let gistsurl: String
    let gravatarid: String
    let type: String
    let avatarurl: String
    let subscriptionsurl: String
    let organizationsurl: String
    let receivedEventsurl: String
    let reposurl: String
    let login: String
    let id: Int
    let starredurl: String
    let eventsurl: String
    let followersurl: String
    let followingurl: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case gistsurl = "gists_url"
        case gravatarid = "gravatar_id"
        case type = "type"
        case avatarurl = "avatar_url"
        case subscriptionsurl = "subscriptions_url"
        case organizationsurl = "organizations_url"
        case receivedEventsurl = "received_events_url"
        case reposurl = "repos_url"
        case login = "login"
        case id = "id"
        case starredurl = "starred_url"
        case eventsurl = "events_url"
        case followersurl = "followers_url"
        case followingurl = "following_url"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghCommit
struct ghCommit: Codable, Equatable {
    let url: String
    let message: String
    let distinct: Bool
    let sha: String
    let author: ghAuthor

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case message = "message"
        case distinct = "distinct"
        case sha = "sha"
        case author = "author"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghAuthor
struct ghAuthor: Codable, Equatable {
    let email: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case name = "name"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghForkee
struct ghForkee: Codable, Equatable {
    let forkeeDescription: String
    let fork: Bool
    let url: String
    let language: String
    let stargazersurl: String
    let cloneurl: String
    let tagsurl: String
    let fullName: String
    let mergesurl: String
    let forks: Int
    let forkeePrivate: Bool
    let gitRefsurl: String
    let archiveurl: String
    let collaboratorsurl: String
    let owner: ghUser
    let languagesurl: String
    let treesurl: String
    let labelsurl: String
    let htmlurl: String
    let pushedAt: Date
    let createdAt: Date
    let hasIssues: Bool
    let forksurl: String
    let branchesurl: String
    let commitsurl: String
    let notificationsurl: String
    let openIssues: Int
    let contentsurl: String
    let blobsurl: String
    let issuesurl: String
    let compareurl: String
    let issueEventsurl: String
    let name: String
    let updatedAt: Date
    let statusesurl: String
    let forksCount: Int
    let assigneesurl: String
    let sshurl: String
    let forkeePublic: Bool
    let hasWiki: Bool
    let subscribersurl: String
    // let mirrorurl: JSONNull?
    let watchersCount: Int
    let id: Int
    let hasDownloads: Bool
    let gitCommitsurl: String
    let downloadsurl: String
    let pullsurl: String
    let homepage: String?
    let issueCommenturl: String
    let hooksurl: String
    let subscriptionurl: String
    let milestonesurl: String
    let svnurl: String
    let eventsurl: String
    let gitTagsurl: String
    let teamsurl: String
    let commentsurl: String
    let openIssuesCount: Int
    let keysurl: String
    let giturl: String
    let contributorsurl: String
    let size: Int
    let watchers: Int

    enum CodingKeys: String, CodingKey {
        case forkeeDescription = "description"
        case fork = "fork"
        case url = "url"
        case language = "language"
        case stargazersurl = "stargazers_url"
        case cloneurl = "clone_url"
        case tagsurl = "tags_url"
        case fullName = "full_name"
        case mergesurl = "merges_url"
        case forks = "forks"
        case forkeePrivate = "private"
        case gitRefsurl = "git_refs_url"
        case archiveurl = "archive_url"
        case collaboratorsurl = "collaborators_url"
        case owner = "owner"
        case languagesurl = "languages_url"
        case treesurl = "trees_url"
        case labelsurl = "labels_url"
        case htmlurl = "html_url"
        case pushedAt = "pushed_at"
        case createdAt = "created_at"
        case hasIssues = "has_issues"
        case forksurl = "forks_url"
        case branchesurl = "branches_url"
        case commitsurl = "commits_url"
        case notificationsurl = "notifications_url"
        case openIssues = "open_issues"
        case contentsurl = "contents_url"
        case blobsurl = "blobs_url"
        case issuesurl = "issues_url"
        case compareurl = "compare_url"
        case issueEventsurl = "issue_events_url"
        case name = "name"
        case updatedAt = "updated_at"
        case statusesurl = "statuses_url"
        case forksCount = "forks_count"
        case assigneesurl = "assignees_url"
        case sshurl = "ssh_url"
        case forkeePublic = "public"
        case hasWiki = "has_wiki"
        case subscribersurl = "subscribers_url"
        // case mirrorurl = "mirror_url"
        case watchersCount = "watchers_count"
        case id = "id"
        case hasDownloads = "has_downloads"
        case gitCommitsurl = "git_commits_url"
        case downloadsurl = "downloads_url"
        case pullsurl = "pulls_url"
        case homepage = "homepage"
        case issueCommenturl = "issue_comment_url"
        case hooksurl = "hooks_url"
        case subscriptionurl = "subscription_url"
        case milestonesurl = "milestones_url"
        case svnurl = "svn_url"
        case eventsurl = "events_url"
        case gitTagsurl = "git_tags_url"
        case teamsurl = "teams_url"
        case commentsurl = "comments_url"
        case openIssuesCount = "open_issues_count"
        case keysurl = "keys_url"
        case giturl = "git_url"
        case contributorsurl = "contributors_url"
        case size = "size"
        case watchers = "watchers"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghIssue
struct ghIssue: Codable, Equatable {
    let user: ghUser
    let url: String
    let labels: [Int]
    let htmlurl: String
    let labelsurl: String
    let pullRequest: ghPullRequest
    let createdAt: Date
    let closedAt: Date?
    // let milestone: JSONNull?
    let title: String
    let body: String
    let updatedAt: Date
    let number: Int
    let state: String
    let assignee: ghUser?
    let id: Int
    let eventsurl: String
    let commentsurl: String
    let comments: Int

    enum CodingKeys: String, CodingKey {
        case user = "user"
        case url = "url"
        case labels = "labels"
        case htmlurl = "html_url"
        case labelsurl = "labels_url"
        case pullRequest = "pull_request"
        case createdAt = "created_at"
        case closedAt = "closed_at"
        // case milestone = "milestone"
        case title = "title"
        case body = "body"
        case updatedAt = "updated_at"
        case number = "number"
        case state = "state"
        case assignee = "assignee"
        case id = "id"
        case eventsurl = "events_url"
        case commentsurl = "comments_url"
        case comments = "comments"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghPullRequest
struct ghPullRequest: Codable, Equatable {
    /*let htmlurl: JSONNull?
    let patchurl: JSONNull?
    let diffurl: JSONNull?

    enum CodingKeys: String, CodingKey {
        case htmlurl = "html_url"
        case patchurl = "patch_url"
        case diffurl = "diff_url"
    }*/
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghPage
struct ghPage: Codable, Equatable {
    let pageName: String
    let htmlurl: String
    let title: String
    let sha: String
    // let summary: JSONNull?
    let action: String

    enum CodingKeys: String, CodingKey {
        case pageName = "page_name"
        case htmlurl = "html_url"
        case title = "title"
        case sha = "sha"
        // case summary = "summary"
        case action = "action"
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ghRepo
struct ghRepo: Codable, Equatable {
    let url: String
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
    }
}

typealias ghEvents = [ghWelcomeElement]
