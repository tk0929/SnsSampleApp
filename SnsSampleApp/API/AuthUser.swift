//
//  AuthService.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit
import Firebase

struct AuthCredensials {
    
    let email: String
    let passwoerd: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
    
}

struct AuthUser {
    
    static func loginUser(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
        
    }
    
    
    static func signUpUser(withCredential credentials: AuthCredensials, completion: @escaping(Error?) -> Void) {
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.passwoerd) { (authResult, error) in
                
                if let err = error {
                    print("ユーザの登録へ失敗: \(err.localizedDescription)")
                    return
                }
                
                guard let uid = authResult?.user.uid else { return }
                
                let userData: [String: Any] = ["email": credentials.email,
                                               "fullName": credentials.fullName,
                                               "profileImgaeUrl": imageUrl,
                                               "uid": uid,
                                               "userName": credentials.userName]
                
                Firestore.firestore().collection("users").document(uid).setData(userData, completion: completion)
                
                
            }
            
        }
        
    }
    
}
