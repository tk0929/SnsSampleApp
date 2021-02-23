//
//  ProfileHeaderViewModel.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Foundation

struct ProfileHeaderViewModel {
    
    let user: User
    
    var fullName: String {
        return user.fullName
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
    
    
}
