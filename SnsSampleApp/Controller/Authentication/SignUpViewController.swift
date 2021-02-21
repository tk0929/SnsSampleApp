//
//  SignUpViewController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/20.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Propaerties
    
    private var viewModel = SignUpViewModel()
    private var profileImage: UIImage?
    
    private let selectImageButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.setDimensions(height: 140, width: 140)
        button.addTarget(self, action: #selector(teppedSelectImageButton), for: .touchUpInside)
        
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
        button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.7)
        button.layer.cornerRadius = 10
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        
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
        configureNotificationObservers()
        
    }
    
    
    
    //MARK: - Actions
    @objc private func teppedalreadyHaveAccountButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func textFieldDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField{
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else {
            viewModel.userName = sender.text
        }
        updateForm()
    }
    
    @objc private func teppedSelectImageButton() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func tappedSignUpButton() {
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fulleName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text?.lowercased() else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credentials = AuthCredensials(email: email, passwoerd: password, fullName: fulleName, userName: userName, profileImage: profileImage)
        
        AuthUser.signUpUser(withCredential: credentials) { error in
            if let err = error {
                print("ユーザの登録へ失敗: \(err.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
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
    
    private func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
}


//MARK: - FormViewModel
extension SignUpViewController: FormViewModel {
    //    ログインボタンの色を更新する
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackGroungdColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsVaild
    }
}

//MARK: - UIImagePickerControllerDelegate,UINavigationControllerDelegate
extension SignUpViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImgae = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImgae
        
        selectImageButton.layer.cornerRadius = selectImageButton.frame.width / 2
        selectImageButton.layer.masksToBounds = true
        selectImageButton.layer.borderColor = UIColor.white.cgColor
        selectImageButton.layer.borderWidth = 2
        selectImageButton.setImage(selectedImgae.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
