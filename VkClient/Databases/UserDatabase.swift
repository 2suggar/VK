//
//  UserDatabase.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 31.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation
import UIKit

class UserDatabase {
    // MARK: Public Properties
    var users: [User] = [] {
        didSet {
            self.sortedUsers = sortUsers()
            self.updateUsers?(self.users)
        }
    }
    
    var sortedUsers: [Character: [User]] = [:]
    
    var searchString: String = "" {
        didSet {
            sortedUsers = sortUsers()
        }
    }
    
    var alphabet: [Character] = []
    
    // MARK: Update methods
    var updateUsers: (([User])->Void)?
   
    // MARK: Public Functions
    func sortedUser(for indexPath: IndexPath) -> User? {
        let key = sortedUsers.keys.sorted()[indexPath.section]
        let value = sortedUsers[key]!
        return value[indexPath.row]
    }
    
    // MARK: Private Functions
    private func sortUsers() -> [Character: [User]] {
        var sorted: [Character: [User]] = [:]
        
        for user in users
            where (user.last_name.contains(searchString) || user.first_name.contains(searchString) ||
                searchString == "")
        {
            guard let char = user.last_name.first else {
                break
            }
            
            if sorted.keys.contains(char) {
                sorted[char]?.append(user)
            } else {
                sorted[char] = [user]
            }
        }
        alphabet = sorted.keys.sorted(by: <)
        return sorted
    }
}
