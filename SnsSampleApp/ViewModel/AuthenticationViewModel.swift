//
//  AuthenticationViewModel.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsVaild: Bool { get }
    var buttonBackGroungdColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}


struct LoginViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackGroungdColor: UIColor {
        return formIsVaild ? .systemOrange : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.7)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.7)
    }
}

struct SignUpViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    
    var buttonBackGroungdColor: UIColor {
        return formIsVaild ? .systemOrange : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.7)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.7)
    }
    
    
}

