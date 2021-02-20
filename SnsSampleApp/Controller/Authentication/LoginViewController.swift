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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ログイン", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("パスワードを忘れた方はこちら", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributes:[NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: 16)]
        let boldAttributes:[NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: 16)]
        
        let attributTitle = NSMutableAttributedString(string: "アカウントを持っていない方はこちら　", attributes: attributes)
        attributTitle.append(NSAttributedString(string: "新規登録" ,attributes: boldAttributes))
        button.setAttributedTitle(attributTitle, for: .normal)
        
        button.addTarget(self, action: #selector(tappedDontHaveAccountButton), for: .touchUpInside)
        
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: - Actions
    
    @objc private func tappedDontHaveAccountButton() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
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
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton,forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.anchor(top: loginLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        
    }
    
    
}
