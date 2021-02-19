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
        
    }
    
    
}


extension FeedViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier, for: indexPath)
        return cell
    }
    
    
}
