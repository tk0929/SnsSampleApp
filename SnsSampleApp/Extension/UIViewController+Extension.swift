//
//  UIViewController+Extension.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit
extension UIViewController {
    
     func configuregradientLayer(){
        //        グラデーションを利用した背景色の設定
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemOrange.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    
    
}
