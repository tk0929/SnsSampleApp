//
//  ProfileHeaderViewModel.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import UIKit

struct ProfileHeaderViewModel {
    
    let user: User
    
    var fullName: String {
        return user.fullName
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonText: String {
        if user.isCurrentUser {
            return "プロフィールを編集"
        }
        return user.isFollowed ? "フォロー中" : "フォローする"
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var numberOfFollowers: NSAttributedString {
        return setAttributeText(value: user.stats.followers, label: "フォロワー")
    }
    
    var numberOfFollowing: NSAttributedString {
        return setAttributeText(value: user.stats.following, label: "フォロー中")
    }
    
    
    var numberOfPosts: NSAttributedString {
        return setAttributeText(value: 5, label: "投稿")
    }
    
    
    init(user: User) {
        self.user = user
    }
    
    private func setAttributeText(value: Int, label: String) -> NSAttributedString {
        
        let attributeText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributeText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributeText
    }
    
    
}
