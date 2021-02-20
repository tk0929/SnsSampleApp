//
//  LoginViewController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Propaerties
    private let loginLabel: UILabel = {
        
        let label = UILabel()
        label.text = "ようこそ"
        label.font = UIFont.systemFont(ofSize: 50)
        label.setDimensions(height: 50, width: 200)
        label.textColor = .white

        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.keyboardType = .emailAddress
        textField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textField.setHeight(50)
        textField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        textField.isSecureTextEntry = true
        
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Helpers
    private func configureUI() {
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        //        グラデーションを利用した背景色の設定
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(loginLabel)
        loginLabel.centerX(inView: view)
        loginLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: loginLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
    }
    
    
}
