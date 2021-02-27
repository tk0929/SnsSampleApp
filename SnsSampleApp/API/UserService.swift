//
//  FetchUserData.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import Firebase

typealias FirestoreCompletion = (Error?) -> Void

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
    
    static func follow(uid: String, completion: @escaping(FirestoreCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:],completion: completion)
        }
        
    }
    
    static func unfollow(uid: String, completion: @escaping(FirestoreCompletion)) {
        
        
    }
    

    
}
