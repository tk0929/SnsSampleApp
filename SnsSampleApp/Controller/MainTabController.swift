//
//  MainTabController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/01/02.
//

import UIKit

class MainTabController: UITabBarController {

    
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        
        
    }
    
//MARK: - Helpers
    
    func configureViewControllers() {
        
        let feed = FeedViewController()
        
        let search = SearchViewController()
        
        let imageSelecter = ImageSelecterViewController()
        
        let notification = NotificationViewController()
        
        let profile =  ProfileleViewController()
        
        viewControllers = [feed,search,imageSelecter,notification,profile]
        
    }
    
    
    
}
