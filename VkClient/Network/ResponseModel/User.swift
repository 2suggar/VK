//
//  User.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 05.08.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var photo_100: String = ""
}
