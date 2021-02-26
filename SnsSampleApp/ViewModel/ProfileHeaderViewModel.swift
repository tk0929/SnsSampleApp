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
    
    init(user: User) {
        self.user = user
    }
    
    
}
