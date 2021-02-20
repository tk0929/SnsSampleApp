//
//  SignUpViewController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/20.
//

import UIKit

class SignUpViewController: UIViewController {
  
    //MARK: - Propaerties
    private let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.setDimensions(height: 140, width: 140)
        
        return button
    }()
    
    private let emailTextField: CustumTextField = {
        let textField = CustumTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: CustumTextField = {
        let textField = CustumTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField = CustumTextField(placeholder: "Fullname")
    private let userNameTextField = CustumTextField(placeholder: "Username")
    
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("新規登録", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.attributeTitle(firstTitle: "アカウントを持っている場合　", secondTitle: "ログインはこちら")
        button.addTarget(self, action: #selector(teppedalreadyHaveAccountButton), for: .touchUpInside)
        
        return button
    }()
    
    

    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    //MARK: - Actions
    @objc private func teppedalreadyHaveAccountButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK: - Helpers
    
    private func configureUI() {
        
        configuregradientLayer()
        
        view.addSubview(selectImageButton)
        selectImageButton.centerX(inView: view)
        selectImageButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,fullNameTextField,userNameTextField,signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        stackView.anchor(top: selectImageButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        
        
    }
    
}
