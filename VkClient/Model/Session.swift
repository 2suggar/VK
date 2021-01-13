//
//  Session.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 21.11.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation

class Session {
    static let instance = Session()
    
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
}
