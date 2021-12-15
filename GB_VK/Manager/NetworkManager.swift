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
    
    static func initFriends(controller: FriendsViewController) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_GET_FRIENDS
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "fields", value: "nickname, photo_100")
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let friendsResponse = try JSONDecoder().decode(FriendsResponseContainer.self, from: data!)
                print("LOADED FRIENDS")
                print(friendsResponse)
                controller.setFriends(friends: Array(friendsResponse.response!.items))
            } catch (let error) {
                print(error)
            }
        }
        
        task.resume()
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
        
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let photos = try JSONDecoder().decode(PhotosResponseContainer.self, from: data!)
                print("LOADED PHOTOS")
                print(photos)
            } catch (let error) {
                print(error)
            }
            
            
            
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
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let groups = try JSONDecoder().decode(GroupResponseContainer.self, from: data!)
                print("LOADED GROUPS")
                print(groups)
            } catch (let error) {
                print(error)
            }
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
        
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let groups = try JSONDecoder().decode(GroupResponseContainer.self, from: data!)
                print("LOADED GROUPS FOR QUERY \(query)")
                print(groups)
            } catch (let error) {
                print(error)
            }
        }
        
        task.resume()
    }
}

