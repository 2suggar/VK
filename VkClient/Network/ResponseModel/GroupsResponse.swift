//
//  GroupsResponse.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 27.12.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation

struct GroupsResponse: Decodable {
    var response: GroupsData
}

struct GroupsData: Decodable {
    var count: Int
    var items: [Group]
}
