//
//  DribbbleKit.swift
//  DribbbleKit
//
//  Created by Teemo on 8/4/15.
//  Copyright © 2015 teemo. All rights reserved.
//

import Foundation
import UIKit

public enum Scope: String {
    case Public = "public"
    case Write = "write"
    case Comment = "comment"
    case Upload = "upload"
}

public class DribbbleKit {
    
    let serverRootUrl = "https://dribbble.com"
    
    private var clientId = ""
    private var redirectUri = ""
    private var scope = Scope.Public
    private let state = UIDevice.currentDevice().identifierForVendor?.UUIDString
    
    static private let instance = DribbbleKit()
    
    public class func register(clientId: String, redirectUri: String, scope: Scope) {
        self.instance.clientId = clientId
        self.instance.redirectUri = redirectUri
        self.instance.scope = scope
    }
    
    private func authorizationUrl() -> NSURL {
        return NSURL(string: self.serverRootUrl + "/oauth/authorize?client_id=\(self.clientId)&redirect_uri=\(self.redirectUri)&scope=\(self.scope.rawValue)&state=captainteemo")!
    }
    
    public class func authorization() {
        let webViewController = NSBundle.mainBundle().loadNibNamed("AuthWebViewController", owner: self, options: nil).first as! AuthWebViewController
        webViewController.authUrl = self.instance.authorizationUrl()
        let navigationController = UINavigationController(rootViewController: webViewController)
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(navigationController, animated: true, completion: nil)
    }
}


// keys

private let kId = "id"
private let kName = "name"
private let kUsername = "username"
private let kHtmlUrl = "html_url"
private let kAvatarUrl = "avatar_url"
private let kBio = "bio"
private let kLocation = "location"
private let kLinks = "links"
private let kWeb = "web"
private let kTwitter = "twitter"
private let kBucketsCount = "buckets_count"
private let kCommentsReceivedCount = "comments_received_count"
private let kFollowersCount = "followers_count"
private let kFollowingsCount = "followings_count"
private let kLikesCount = "likes_count"
private let kLikesReceivedCount = "likes_received_count"
private let kProjectsCount = "projects_count"
private let kReboundsReceivedCount = "rebounds_received_count"
private let kReboundsCount = "rebounds_count"
private let kShotsCount = "shots_count"
private let kTeamsCount = "teams_count"
private let kCanUploadShot = "can_upload_shot"
private let kType = "type"
private let kPro = "pro"
private let kBucketsUrl = "buckets_url"
private let kFollowersUrl = "followers_url"
private let kFollowingUrl = "following_url"
private let kLikesUrl = "likes_url"
private let kShotsUrl = "shots_url"
private let kTeamsUrl = "teams_url"
private let kCreateDate = "created_at"
private let kUpdateDate = "updated_at"
private let kTitle = "title"
private let kDescription = "description"
private let kWidth = "width"
private let kHeight = "height"
private let kImages = "images"
private let kHidpi = "hidpi"
private let kNormal = "normal"
private let kTeaser = "teaser"
private let kViewsCount = "views_count"
private let kCommentsCount = "comments_count"
private let kAttachmentsCount = "attachments_count"
private let kCommentsUrl = "comments_url"
private let kProjectsUrl = "projects_url"
private let kReboundsUrl = "rebounds_url"
private let kAttachmentsUrl = "attachments_url"
private let kAnimated = "animated"
private let kTags = "tags"
private let kUser = "user"
private let kTeam = "team"

// models

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