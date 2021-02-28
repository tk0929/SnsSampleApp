//
//  User.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Foundation
import Firebase

struct User {
    
    let email: String
    let fullName: String
    let profileImageUrl: String
    let userName: String
    let uid: String
    
    var isFollowed = false
    var isCurrentUser: Bool {return Auth.auth().currentUser?.uid == uid}
    
    var stats: UserStats!
    
    init(dictionary: [String: Any]) {
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        self.stats = UserStats(followers: 0, following: 0)
    }
    
}
