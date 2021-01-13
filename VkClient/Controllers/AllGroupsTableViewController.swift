//
//  AllGroupsTableViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 24.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var allGroups: [Group] = []
    private var currentGroups: [Group] = []
    
    init() {
        currentGroups = allGroups
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        currentGroups = allGroups
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.model = currentGroups[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentGroup = currentGroups[indexPath.row]
        
        let alertViewController = UIAlertController(title: "Вы хотите вступить в эту группу?", message: nil, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "вступить", style: .default, handler: { _ in
            NetworkService.shared.join(group: currentGroup)
        }))
        alertViewController.addAction(UIAlertAction(title: "отмена", style: .cancel, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }

}

extension AllGroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkService.shared.searchGroups(by: searchText) { groups in
            self.currentGroups = groups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
