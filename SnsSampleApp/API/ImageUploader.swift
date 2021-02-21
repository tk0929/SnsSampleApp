//
//  imageUploader.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_Images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { metaData, error in
            if let err = error {
                print("画像アップロード失敗: \(err.localizedDescription)")
                return
            }
            
            ref.downloadURL { ( url, error ) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
                
            }
            
        }
        
    }
    
    
}
