//
//  ProfileHeader.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/21.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    //MARK: - Propaerties
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
