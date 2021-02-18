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
    
    private func configureViewControllers() {
        
        view.backgroundColor = .white
        
        let feed = templeteNavigationControlller(selectedImage: <#T##UIImage#>, unselectedImage: <#T##UIImage#>, rootViewController: FeedViewController())
        
        let search = templeteNavigationControlller(selectedImage: <#T##UIImage#>, unselectedImage: <#T##UIImage#>, rootViewController: SearchViewController())
        
        let imageSelecter = templeteNavigationControlller(selectedImage: <#T##UIImage#>, unselectedImage: <#T##UIImage#>, rootViewController: ImageSelecterViewController())
        
        let notification = templeteNavigationControlller(selectedImage: <#T##UIImage#>, unselectedImage: <#T##UIImage#>, rootViewController: NotificationViewController())
        
        let profile =  templeteNavigationControlller(selectedImage: <#T##UIImage#>, unselectedImage: <#T##UIImage#>, rootViewController: ProfileleViewController())
        
        viewControllers = [feed,search,imageSelecter,notification,profile]
        tabBar.tintColor = .black
    }
    
    
    private func templeteNavigationControlller(selectedImage: UIImage,unselectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
        
    }

    
    
    
}
