//
//  ProfileHeader.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit
import SDWebImage

protocol profileHeaderDelegate: class {
    func header(_ profileHeader: ProfileHeader, didTapActionButtonFor user: User )
}

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Propaerties
    
    var viewModel: ProfileHeaderViewModel? {
        didSet { configureProfileHeder() }
    }
    
    weak var delegate: profileHeaderDelegate?
    
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("プロフィールを編集", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(teppedEditProfileButton), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var postCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = setAttributeText(value: 1, label: "投稿")
        return label
        
    }()
    
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = setAttributeText(value: 1, label: "フォロー")
        
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = setAttributeText(value: 1, label: "フォロワー")
        
        return label
    }()
    
    let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.setDimensions(height: 80, width: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 12)
        
        
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        
        addSubview(editProfileButton)
        editProfileButton.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 24, paddingRight: 24)
        
        
        
        let labelStack = UIStackView(arrangedSubviews: [postCountLabel,followingLabel,followersLabel])
        labelStack.distribution = .fillEqually
        addSubview(labelStack)
        labelStack.centerY(inView: profileImageView)
        labelStack.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)
        
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        let buttomDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        
        let buttonStack = UIStackView(arrangedSubviews: [gridButton, listButton, bookMarkButton])
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        addSubview(topDivider)
        addSubview(buttomDivider)
        
        buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        buttomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc private func teppedEditProfileButton() {
        guard let viewModel = viewModel else { return }
        delegate?.header(self, didTapActionButtonFor: viewModel.user)
    }
    
    //MARK: - Helpers
    func configureProfileHeder() {
        
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.fullName
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        
        editProfileButton.setTitle(viewModel.followButtonText, for: .normal)
        editProfileButton.setTitleColor(viewModel.followButtonTextColor, for: .normal)
        editProfileButton.backgroundColor = viewModel.followButtonBackgroundColor
        
    }
    
    func setAttributeText(value: Int, label: String) -> NSAttributedString {
        
        let attributeText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributeText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributeText
    }
    
    
    
}
