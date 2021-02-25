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
    private var filteredUsers = [User]()
    //   検索バー
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var isSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confitureTableView()
        fetchUsers()
        configureSearchController()
        
    }
    
    //MARK: - Helpers
    
    func confitureTableView() {
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 64
    }
    
    func configureSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "検索"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        
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
        return isSearchMode ? filteredUsers.count : users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! UserCell
        
        let user = isSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        cell.viewModel = UserCellViewModel(user: user)
        
        return cell
        
    }
    
}

//MARK: - UITableViewDataSource

extension SearchViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = isSearchMode ? filteredUsers[indexPath.row] : users[indexPath.row]
        let controller = ProfileViewController(user: user)
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}

//MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        
        filteredUsers = users.filter({
            $0.userName.contains(searchText) ||
                $0.fullName.lowercased().contains(searchText)
        })

        self.tableView.reloadData()
    }
    
    
}


