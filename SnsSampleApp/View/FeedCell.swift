//
//  FeedCell.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/20.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
//    MARK: - Propaerties
    
    private let profileImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = #imageLiteral(resourceName: "ProfileImage")
        return imageView
    }()
// 
    private lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("テスト", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(tappedUserNameButton), for: .touchUpInside)
    
        return button
    }()
    
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageVIew)
        profileImageVIew.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12,paddingLeft: 12)
        profileImageVIew.setDimensions(height: 40, width: 40)
        profileImageVIew.layer.cornerRadius = 40/2
        
        addSubview(userNameButton)
        userNameButton.centerY(inView: profileImageVIew, leftAnchor: profileImageVIew.rightAnchor, paddingLeft: 8)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//     MARK: - Actions
    
    @objc func tappedUserNameButton() {
        print("DEBUG: tapped UserNameButton")
    }

    
    
}
