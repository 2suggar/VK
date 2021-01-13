//
//  NewsTableViewController.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 04.09.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.photoImageView.image = UIImage(named: "news1")
        cell.captionLabel.text = "Воландеморт вернулся?"
        return cell
    }
}
