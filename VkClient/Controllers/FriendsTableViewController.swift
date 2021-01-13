//
//  FriendsTableViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 05.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var userDatabase = NetworkService.shared.userDatabase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        NetworkService.shared.getFriends()
        userDatabase.updateUsers = { users in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        userDatabase.alphabet.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = userDatabase.alphabet[section]
        return userDatabase.sortedUsers[key]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        let key = userDatabase.alphabet[indexPath.section]
        cell.model = userDatabase.sortedUsers[key]?[indexPath.row] ?? nil
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 16.0))
//        view.backgroundColor = UIColor.init(red: 237, green: 238, blue: 240, alpha: 0.5)
//        return view
//    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(userDatabase.alphabet[section])
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        16.0
//    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoVC = segue.destination as? PhotosCollectionViewController {
            if let indexPath = tableView.indexPath(for: sender as! FriendsTableViewCell) {
                photoVC.user = userDatabase.sortedUser(for: indexPath)
            }
        }
    }
}

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.userDatabase.searchString = searchText
        self.tableView.reloadData()
    }
}
