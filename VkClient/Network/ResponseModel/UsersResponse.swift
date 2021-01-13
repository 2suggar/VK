//
//  UsersResponse.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 20.12.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation

struct UsersResponse: Decodable {
    var response: UsersData
}

struct UsersData: Decodable {
    var count: Int
    var items: [User]
}
