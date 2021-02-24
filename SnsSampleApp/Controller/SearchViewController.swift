//
//  SearchTabController.swift
//  SnsSampleApp
//
//  Created by t.koike on 2021/02/17.
//

import UIKit

class SearchViewController: UITableViewController {
    
    //MARK: - Propaerties
    private let reuseIdentifier = "UserCell"
    
    private var users = [User]()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confitureTableView()
        fetchUsers()
        
    }
    
    //MARK: - Helpers
    
    func confitureTableView() {
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 64
        
    }
    
    //MARK: - API
    func fetchUsers() {
        
        UserService.fetchUsersData { (users) in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
}

    //MARK: - UITableViewDataSource

extension SearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! UserCell
        cell.viewModel = UserCellViewModel(user: users[indexPath.row])
        return cell
        
    }
    
}

    //MARK: - UITableViewDataSource

extension SearchViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = ProfileViewController(user: users[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}




