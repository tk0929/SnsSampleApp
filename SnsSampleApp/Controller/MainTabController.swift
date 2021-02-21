//
//  MainTabController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/01/02.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        checkIfUserIsLoggedIn()
        
    }
    
    //MARK: - API
    
    private func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginViewController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: - Helpers
    
    private func configureViewControllers() {
        
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        
        let feed = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "home_selected"),unselectedImage:#imageLiteral(resourceName: "home_unselected"), rootViewController: FeedViewController(collectionViewLayout: layout))
    
        let search = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "search_selected"), unselectedImage: #imageLiteral(resourceName: "search_unselected"), rootViewController: SearchViewController())
        
        let imageSelecter = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "plus_unselected"), unselectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelecterViewController())
        
        let notification = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "like_selected"), unselectedImage: #imageLiteral(resourceName: "like_unselected"), rootViewController: NotificationViewController())
        
        let profile =  templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "profile_selected"), unselectedImage: #imageLiteral(resourceName: "profile_unselected"), rootViewController: ProfileleViewController())
        
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
