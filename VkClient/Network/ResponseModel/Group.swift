//
//  Group.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 23.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation
import RealmSwift

class Group: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo_100: String = ""
}
