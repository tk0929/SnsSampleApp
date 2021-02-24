//
//  UserCell.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/23.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Propaerties
    
    var viewModel: UserCellViewModel? {
        didSet { updateUserCell() }
    }
    
    
    
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.image = #imageLiteral(resourceName: "ProfileImage")
        
        return imageView
    }()
    
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "ここにユーザー名"
        
        return label
    }()
    
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "ここにフルネーム"
        label.textColor = .lightGray
        
        return label
    }()
    
    
    
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(profileImageView)
        profileImageView.setDimensions(height: 48, width: 48)
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 17)
        
        
        let labelStack = UIStackView(arrangedSubviews: [userNameLabel,fullNameLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 4
        labelStack.alignment = .leading
        addSubview(labelStack)
        labelStack.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 12)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateUserCell() {
        
        guard let viewModel = viewModel else { return }
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        userNameLabel.text = viewModel.userName
        fullNameLabel.text = viewModel.fullName
        
    }
    
    
}
