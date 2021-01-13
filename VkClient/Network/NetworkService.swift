//
//  NetworkService.swift
//  VkClient
//
//  Created by Ekaterina Akulina on 22.11.2020.
//  Copyright © 2020 Ekaterina Akulina. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    // MARK: Public properties
    var userDatabase = UserDatabase()
    
    var groups: [Group] = [] {
        didSet {
            updateGroups?(groups)
        }
    }
    
    var updateGroups: (([Group])->Void)?
    
    let baseUrl = "https://api.vk.com/method"
    let baseHost = "api.vk.com"
    
    // MARK: Public methods
    func getFriends() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/friends.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "photo_100")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(UsersResponse.self, from: data)
                self.userDatabase.users = json.response.items
            } catch let error {
                print(error)
            }
        }.resume()
        
        return
    }
    
    func getPhotos(by id: String, completion: @escaping ([Photo])->Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/photos.getAll"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "owner_id", value: id),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(PhotosResponse.self, from: data)
                completion(json.response.items)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getGroups() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/groups.get"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "owner_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "extended", value: "1")
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(GroupsResponse.self, from: data)
                self.groups = json.response.items
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func searchGroups(by name: String, completion: @escaping ([Group])->Void ) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/groups.search"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "q", value: name)
        ]
        
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONDecoder().decode(GroupsResponse.self, from: data)
                print(json)
                completion(json.response.items)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func join(group: Group) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/groups.join"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "group_id", value: String(group.id))
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                if let parsed = json as? [String: Int],
                   parsed["response"] == 1
                {
                    print("SUCCESS")
                    self.getGroups()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func leave(group: Group) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseHost
        components.path = "/method/groups.leave"
        components.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "v", value: "5.126"),
            URLQueryItem(name: "group_id", value: String(group.id))
        ]
        
        URLSession.shared.dataTask(with: components.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                if let parsed = json as? [String: Int],
                   parsed["response"] == 1
                {
                    print("SUCCESS")
                    self.getGroups()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
