//
//  UseCellViewModel.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Foundation


struct UserCellViewModel {
    
    private let user: User
   
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var userName: String {
        return user.userName
    }
    
    var fullName: String {
        return user.fullName
    }
    
    init(user: User) {
        self.user = user
    }
    
}
