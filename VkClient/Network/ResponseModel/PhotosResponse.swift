//
//  PhotosResponse.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 27.12.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation

struct PhotosResponse: Decodable {
    var response: PhotosData
}

struct PhotosData: Decodable {
    var items: [Photo]
}
