//
//  DribbbleKit.swift
//  DribbbleKit
//
//  Created by Teemo on 8/4/15.
//  Copyright © 2015 teemo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Scope {
    case Public
    case Write
    case Comment
    case Upload
}


public class DribbbleKit {
    class func register() {
        
    }
}


// keys

let kId = "id"
let kName = "name"
let kUsername = "username"
let kHtmlUrl = "html_url"
let kAvatarUrl = "avatar_url"
let kBio = "bio"
let kLocation = "location"
let kLinks = "links"
let kWeb = "web"
let kTwitter = "twitter"
let kBucketsCount = "buckets_count"
let kCommentsReceivedCount = "comments_received_count"
let kFollowersCount = "followers_count"
let kFollowingsCount = "followings_count"
let kLikesCount = "likes_count"
let kLikesReceivedCount = "likes_received_count"
let kProjectsCount = "projects_count"
let kReboundsReceivedCount = "rebounds_received_count"
let kReboundsCount = "rebounds_count"
let kShotsCount = "shots_count"
let kTeamsCount = "teams_count"
let kCanUploadShot = "can_upload_shot"
let kType = "type"
let kPro = "pro"
let kBucketsUrl = "buckets_url"
let kFollowersUrl = "followers_url"
let kFollowingUrl = "following_url"
let kLikesUrl = "likes_url"
let kShotsUrl = "shots_url"
let kTeamsUrl = "teams_url"
let kCreateDate = "created_at"
let kUpdateDate = "updated_at"
let kTitle = "title"
let kDescription = "description"
let kWidth = "width"
let kHeight = "height"
let kImages = "images"
let kHidpi = "hidpi"
let kNormal = "normal"
let kTeaser = "teaser"
let kViewsCount = "views_count"
let kCommentsCount = "comments_count"
let kAttachmentsCount = "attachments_count"
let kCommentsUrl = "comments_url"
let kProjectsUrl = "projects_url"
let kReboundsUrl = "rebounds_url"
let kAttachmentsUrl = "attachments_url"
let kAnimated = "animated"
let kTags = "tags"
let kUser = "user"
let kTeam = "team"

public class Model {
    public var id: String
    public var createdDate: String
    public var updatedDate: String
    
    public init(info: JSON) {
        self.id = info[kId].stringValue
        self.createdDate = info[kCreateDate].stringValue
        self.updatedDate = info[kUpdateDate].stringValue
    }
}

public class User: Model {
    
    private(set) public var name: String
    private(set) public var username: String
    private(set) public var avatarUrl: String
    private(set) public var bio: String
    private(set) public var location: String
    private(set) public var web: String
    private(set) public var twitter: String
    private(set) public var bucketsCount: Int
    private(set) public var commentsReceivedCount: Int
    private(set) public var followersCount: Int
    private(set) public var followingsCount: Int
    private(set) public var likesCount: Int
    private(set) public var likesReceivedCount: Int
    private(set) public var projectsCount: Int
    private(set) public var reboundsReceivedCount: Int
    private(set) public var shotsCount: Int
    private(set) public var teamsCount: Int
    private(set) public var canUploadShot: Bool
    private(set) public var type: String
    private(set) public var pro: Bool
    private(set) public var bucketsUrl: String
    private(set) public var followersUrl: String
    private(set) public var followingUrl: String
    private(set) public var likesUrl: String
    private(set) public var shotsUrl: String
    private(set) public var teamsUrl: String
    
    public override init(info: JSON) {
        
        self.name                  = info[kName].stringValue
        self.username              = info[kUsername].stringValue
        self.avatarUrl             = info[kAvatarUrl].stringValue
        self.bio                   = info[kBio].stringValue
        self.location              = info[kLocation].stringValue
        self.web                   = info[kWeb].stringValue
        self.twitter               = info[kTwitter].stringValue
        self.bucketsCount          = info[kBucketsCount].intValue
        self.commentsReceivedCount = info[kCommentsReceivedCount].intValue
        self.followersCount        = info[kFollowersCount].intValue
        self.followingsCount       = info[kFollowingsCount].intValue
        self.likesCount            = info[kLikesCount].intValue
        self.likesReceivedCount    = info[kLikesReceivedCount].intValue
        self.projectsCount         = info[kProjectsCount].intValue
        self.reboundsReceivedCount = info[kReboundsReceivedCount].intValue
        self.shotsCount            = info[kShotsCount].intValue
        self.teamsCount            = info[kTeamsCount].intValue
        self.canUploadShot         = info[kCanUploadShot].boolValue
        self.type                  = info[kType].stringValue
        self.pro                   = info[kPro].boolValue
        self.bucketsUrl            = info[kBucketsUrl].stringValue
        self.followersUrl          = info[kFollowersUrl].stringValue
        self.followingUrl          = info[kFollowingUrl].stringValue
        self.likesUrl              = info[kLikesUrl].stringValue
        self.shotsUrl              = info[kShotsUrl].stringValue
        self.teamsUrl              = info[kTeamsUrl].stringValue
        
        super.init(info: info)
    }
}

public class Shot: Model {
    
    private(set) public var title: String
    private(set) public var description: String
    private(set) public var width: CGFloat
    private(set) public var height: CGFloat
    private(set) public var hidpiImageUrl: String
    private(set) public var normalImageUrl: String
    private(set) public var teaserImageUrl: String
    private(set) public var viewsCount: Int
    private(set) public var likesCount: Int
    private(set) public var commentsCount: Int
    private(set) public var attachmentsCount: Int
    private(set) public var reboundsCount: Int
    private(set) public var bucketsCount: Int
    private(set) public var htmlUrl: String
    private(set) public var attachmentsUrl: String
    private(set) public var bucketsUrl: String
    private(set) public var commentUrl: String
    private(set) public var likesUrl: String
    private(set) public var projectsUrl: String
    private(set) public var reboundsUrl: String
    private(set) public var animated: Bool
    private(set) public var tags: [String]
    private(set) public var user: User
    private(set) public var team: User
    
    public override init(info: JSON) {
        
        self.title = info[kTitle].stringValue
        self.description = info[kDescription].stringValue
        self.width = CGFloat(info[kWidth].floatValue)
        self.height = CGFloat(info[kHeight].floatValue)
        self.hidpiImageUrl = info[kImages][kHidpi].stringValue
        self.normalImageUrl = info[kImages][kNormal].stringValue
        self.teaserImageUrl = info[kImages][kTeaser].stringValue
        self.viewsCount = info[kViewsCount].intValue
        self.likesCount = info[kLikesCount].intValue
        self.commentsCount = info[kCommentsCount].intValue
        self.attachmentsCount = info[kAttachmentsCount].intValue
        self.reboundsCount = info[kReboundsCount].intValue
        self.bucketsCount = info[kBucketsCount].intValue
        self.htmlUrl = info[kHtmlUrl].stringValue
        self.attachmentsUrl = info[kAttachmentsUrl].stringValue
        self.bucketsUrl = info[kBucketsUrl].stringValue
        self.commentUrl = info[kCommentsUrl].stringValue
        self.likesUrl = info[kLikesUrl].stringValue
        self.projectsUrl = info[kProjectsUrl].stringValue
        self.reboundsUrl = info[kReboundsUrl].stringValue
        self.animated = info[kAnimated].boolValue
        self.tags = info[kTags].arrayObject as! [String]
        self.user = User(info: info[kUser])
        self.team = User(info: info[kTeam])
        
        super.init(info: info)
    }
}

public class Project: Model {
    
    private(set) public var name: String
    private(set) public var description: String
    private(set) public var shotsCount: Int
    private(set) public var user: User
    
    public override init(info: JSON) {
        
        self.name = info[kName].stringValue
        self.description = info[kDescription].stringValue
        self.shotsCount = info[kShotsCount].intValue
        self.user = User(info: info[kUser])
        
        super.init(info: info)
    }
}

public class Bucket: Project {
    
}