//
//  UploadPostViewController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/03/03.
//

import UIKit

class UploadPostViewController: UIViewController {
    
    //MARK: - Propaerties
    
    private let photoImgaeView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let captionTextView: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confitureUI()
        
    }
    
    //MARK: - Actions
    
    @objc private func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapShareButton() {
        
        print("シェアボタンが押されました")
        
    }
    
    
    
    //MARK: - Helpers
    private  func confitureUI() {
        
        view.backgroundColor = .white
        navigationItem.title = "投稿画面"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "シェア", style: .done, target: self, action: #selector(didTapShareButton))
        
    }
    
    
}
