//
//  FetchUserData.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Firebase

struct UserService {
// エラー時の処理も追記するべき
    static func fetchCurrentUserData(complition: @escaping(User) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { ( snapShot , error) in
            
            guard let dictionary = snapShot?.data() else { return }
            let user = User(dictionary: dictionary)
            complition(user)
        }
    }
    
    
    static func fetchUsersData(completion: @escaping([User]) -> Void) {
        COLLECTION_USERS.getDocuments { (snapShot, error) in
          
            guard let snapShot = snapShot else { return }
            
            let users = snapShot.documents.map{( User(dictionary: $0.data() ))}
            completion(users)
            
        }
        
        
    }
    
}
