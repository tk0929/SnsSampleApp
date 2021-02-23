//
//  User.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Foundation

struct User {
    
    let email: String
    let fullName: String
    let profileImageUrl: String
    let userName: String
    let uid: String
    
    init(dictionary: [String: Any]) {
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
    
}
