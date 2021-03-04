//
//  MainTabController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/01/02.
//

import UIKit
import Firebase
import YPImagePicker

class MainTabController: UITabBarController {
    
//MARK: - Propaerties
    
    private var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)
        }
    }
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
        fetchCurrentUser()
        
    }
    
//MARK: - API
    private func fetchCurrentUser() {
        UserService.fetchCurrentUserData { userData in
            self.user = userData
            
        }
    }
    
    private func checkIfUserIsLoggedIn() {
        
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginViewController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    
//MARK: - Helpers
    
    private func configureViewControllers(withUser user: User) {
        
        view.backgroundColor = .white
        self.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        
        let feed = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "home_selected"),unselectedImage:#imageLiteral(resourceName: "home_unselected"), rootViewController: FeedViewController(collectionViewLayout: layout))
        
        let search = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "search_selected"), unselectedImage: #imageLiteral(resourceName: "search_unselected"), rootViewController: SearchViewController())
        
        let imageSelecter = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "plus_unselected"), unselectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelecterViewController())
        
        let notification = templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "like_selected"), unselectedImage: #imageLiteral(resourceName: "like_unselected"), rootViewController: NotificationViewController())
        
        let profileViewController = ProfileViewController(user: user)
        let profile =  templeteNavigationControlller(selectedImage: #imageLiteral(resourceName: "profile_selected"), unselectedImage: #imageLiteral(resourceName: "profile_unselected"), rootViewController: profileViewController)
        
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
    
    func didFinishPickingMedia(_ picker: YPImagePicker) {
        picker.didFinishPicking { items, _ in
            picker.dismiss(animated: true) {
                
                guard let selectedImgae = items.singlePhoto?.image else { return }
                let controller = UploadPostViewController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false, completion: nil)
                
            }
            
        }
        
    }
    
}

//MARK: - AuthenticaionDelegate

extension MainTabController: AuthenticaionDelegate {
    
    func authenticaionDidComplete() {
        fetchCurrentUser()
        self.dismiss(animated: true, completion: nil)
        
    }
}

//MARK: - UITabBarControllerDelegate

extension MainTabController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.firstIndex(of: viewController)
        if index == 2 {
            
            var config = YPImagePickerConfiguration()
            config.library.mediaType = .photo
            config.shouldSaveNewPicturesToAlbum = false
            config.startOnScreen = .library
            config.screens = [.library]
            config.hidesStatusBar = false
            config.hidesBottomBar = false
            config.library.maxNumberOfItems = 1
            
            let picker = YPImagePicker(configuration: config)
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
            
            didFinishPickingMedia(picker)
        }
        
        return true
    }
    
}
