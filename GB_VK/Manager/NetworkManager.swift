//
//  NetworkManager.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 26.11.2021.
//

import Foundation

class NetworkManager {
    
    static let HTTPS_SCHEME = "https"
    static let VK_HOST = "api.vk.com"
    static let METHOD_PATH = "/method/"
    static let VK_VERSION = "5.82"
    static let API_GET_FRIENDS = "friends.get"
    static let API_GET_PHOTOS = "photos.get"
    static let API_GET_GROUPS = "groups.get"
    static let API_GROUPS_SEARCH = "groups.search"
    
    static func getFriends() -> Any { //todo will return object very soon
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_GET_FRIENDS
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "fields", value: "nickname")
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        var json: Any = ""
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print("LOADED FRIENDS")
            print(json)
        }
        
        task.resume()
        return json //todo need to wait before json will be init
    }
    
    static func getPhotos() {//todo will return something
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_GET_PHOTOS
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "album_id", value: "profile")
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        var json: Any = ""
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print("LOADED PHOTOS")
            print(json)
        }
        
        task.resume()
    }
    
    static func getGroups() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_GET_GROUPS
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "fields", value: "description"),
            URLQueryItem(name: "extended", value: "1")
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        var json: Any = ""
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print("LOADED GROUPS")
            print(json)
        }
        
        task.resume()
    }
    
    static func getGroups(query: String) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_GROUPS_SEARCH
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "q", value: query)
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        var json: Any = ""
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print("LOADED GROUPS FOR QUERY \(query)")
            print(json)
        }
        
        task.resume()
    }
}

