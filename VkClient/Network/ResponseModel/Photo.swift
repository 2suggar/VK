//
//  Photo.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 27.12.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation
import RealmSwift

class Photo: Decodable {
    var sizes: [SizePhoto] = []
}

class SizePhoto: Decodable {
    var type: String = ""
    var url: String = ""
}
