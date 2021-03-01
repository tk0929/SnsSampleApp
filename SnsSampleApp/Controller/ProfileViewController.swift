//
//  ProfileTabController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/17.
//

import UIKit

private let cellReuseIdentifier = "ProfileCell"
private let headerReuseIdentifier = "ProfileHeader"

class ProfileViewController: UICollectionViewController {
    
//MARK: - Propaerties
    
    private var user: User
    
//MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        checkIfUserIsFollowed()
        fetchUserStats()
        
    }
    
//MARK: - API
    
    func checkIfUserIsFollowed() {
        UserService.checkIfUserIsFollowed(uid: user.uid) { isFollowed in
            self.user.isFollowed = isFollowed
            self.collectionView.reloadData()
        }
    }
    
    func fetchUserStats() {
        UserService.fetchUserStats(uid: user.uid) { stats in
            self.user.stats = stats
            self.collectionView.reloadData()
        }
    }

//MARK: - Helpers
    
    private func configureCollectionView() {
        navigationItem.title = user.userName
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
    }
    
}

//MARK: - UICollectionViewDataSource

extension ProfileViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind , withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! ProfileHeader
       
        header.delegate = self
        header.viewModel = ProfileHeaderViewModel(user: user)
    
        return header
    }
    
}

//MARK: - UICollectionViewDelegate
extension ProfileViewController {
    
}



//MARK: - UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    //    collectionViewのセル間の感覚を1ピクセル開ける
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2 ) / 3
        return CGSize(width: width , height: width)
    }
    
    //    headerの幅と高さの設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
    
}

//MARK: - profileHeaderDelegate

extension ProfileViewController: profileHeaderDelegate {
    
    func header(_ profileHeader: ProfileHeader, didTapActionButtonFor user: User) {
       
        if user.isCurrentUser {
            print("プロフィールを編集を表示")
            
        } else if user.isFollowed {
            UserService.unfollow(uid: user.uid) { error in
                self.user.isFollowed = false
                self.collectionView.reloadData()
            }
            
        } else {
            UserService.follow(uid: user.uid) { error in
                self.user.isFollowed = true
                self.collectionView.reloadData()
                
            }
           
        }
        
    }
    

}
