//
//  UIButton+Extensino.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit

extension UIButton {
    
    func attributeTitle(firstTitle: String, secondTitle: String) {
        
        let attributes:[NSAttributedString.Key: Any] = [ .foregroundColor: UIColor(white: 1, alpha: 0.9), .font: UIFont.systemFont(ofSize: 16)]
        let boldAttributes:[NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.systemBlue, .font: UIFont.boldSystemFont(ofSize: 16)]
        
        let attributTitle = NSMutableAttributedString(string: firstTitle , attributes: attributes)
        attributTitle.append(NSAttributedString(string: secondTitle ,attributes: boldAttributes))
        
        setAttributedTitle(attributTitle, for: .normal)
        
    }
}
