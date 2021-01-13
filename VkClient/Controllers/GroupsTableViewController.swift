//
//  GroupsTableViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 23.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

protocol GroupsTableViewControllerDelegate {
    func addGroup(group: Group)
}

final class GroupsTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var allGroups: [Group] = [] {
        didSet {
            currentGroups = allGroups
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    private var currentGroups: [Group] = []
    
    init() {
//        allGroups = groupDatabase.ownGroups
//        currentGroups = allGroups
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
//        allGroups = groupDatabase.ownGroups
//        currentGroups = allGroups
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        NetworkService.shared.getGroups()
        allGroups = NetworkService.shared.groups
        NetworkService.shared.updateGroups = { groups in
            self.allGroups = groups
        }
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        allGroups = groupDatabase.ownGroups
//        currentGroups = allGroups
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.model = currentGroups[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let currentGroup = currentGroups[indexPath.row]
        if editingStyle == .delete {
            NetworkService.shared.leave(group: currentGroup)
        }
    }

}

extension GroupsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentGroups = allGroups.filter({ (group) -> Bool in
            group.name.contains(searchText) || searchText.isEmpty
        })
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
