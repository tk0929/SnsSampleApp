//
//  FetchUserData.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Firebase

struct UserService {
    
    static func fetchCurrentUserData(complition: @escaping(User) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { ( snapShot , error) in
            
            guard let dictionary = snapShot?.data() else { return }
            let user = User(dictionary: dictionary)
            complition(user)
        }
    }
    
    
}
