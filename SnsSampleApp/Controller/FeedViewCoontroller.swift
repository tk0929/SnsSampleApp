//
//  FeedTabCoontroller.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/17.
//

import UIKit

class FeedViewController: UICollectionViewController {
    
    private let ReuseIdentifier = "Cell"
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    
//MARK: - Helpers
    private func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: ReuseIdentifier)
    }
    
    
}

//MARK: - UIColelctionViewDataSource

extension FeedViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
//     profileImageの高さと上下の感覚を足す
        var hight = width + 8 + 40 + 8
//　　　この高さが現段階ではちょうどいい気がする
        hight += 120
        return CGSize(width: width, height: hight)
    }
    
}
