//
//  NetworkManager.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 26.11.2021.
//

import Foundation
import PromiseKit

class NetworkManager {
    
    static let HTTPS_SCHEME = "https"
    static let VK_HOST = "api.vk.com"
    static let METHOD_PATH = "/method/"
    static let VK_VERSION = "5.82"
    static let API_GET_FRIENDS = "friends.get"
    static let API_GET_PHOTOS = "photos.get"
    static let API_GET_GROUPS = "groups.get"
    static let API_GROUPS_SEARCH = "groups.search"
    static let API_ACCOUNT_GET_PROFILE_INFO = "account.getProfileInfo"
    static let API_NEWSFEED_GET = "newsfeed.get"
    
    static func initFriends(controller: FriendsViewController) {
         getUrl()
            .then(on: DispatchQueue.global(), getData(url:))
            .then(getParsedData(data:))
            .done(on: DispatchQueue.main) { items in
                controller.setFriends(friends: items)
            }.catch { error in
                print(error)
            }
    }
    
    static func getUrl() -> Promise<URL> {
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
        
        return Promise { resolver in
            guard let url = urlConstructor.url else {
                resolver.reject(AppError.notCorrectUrl)
                return
            }
            resolver.fulfill(url)
        }
    }
    
    static func getData(url: URL) -> Promise<Data> {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return Promise { resolver in
            session.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    resolver.reject(AppError.errorTask)
                    return
                }
                resolver.fulfill(data)
            }.resume()
        }
    }
    
    static func getParsedData(data: Data) -> Promise<[User]> {
        return Promise { resolver in
            do {
                let friendsResponse = try JSONDecoder().decode(FriendsResponseContainer.self, from: data)
                print("LOADED FRIENDS")
                print(friendsResponse.response.items)
                resolver.fulfill(friendsResponse.response.items)
            } catch (let error) {
                print(error)
                resolver.reject(AppError.failedToDecode)
            }
        }
    }
    
    static func initNews(controller: NewsViewController) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_NEWSFEED_GET
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "5"),
            URLQueryItem(name: "filters", value: "post")
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        let queue = OperationQueue()
        queue.addOperation {
            let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
                do {
                    print(Session.instance.token)
                    print(try JSONSerialization.jsonObject(with: data!, options: []))
                    let newsItemsResponse = try JSONDecoder().decode(NewsItemResponseContainer.self, from: data!)
                    print("LOADED NEWS")
                    //                print(newsItemsResponse)
                    controller.setNewsItems(newsItems: newsItemsResponse.response.items)
                    controller.setNewsProfiles(profiles: newsItemsResponse.response.profiles)
                    controller.setGroups(groups: newsItemsResponse.response.groups)
                } catch (let error) {
                    print(error)
                }
            }
            
            task.resume()
        }
        
    }
    
    static func initNewsWithTime(_ timeInterval1970: String, forController controller: NewsViewController) {
        var urlConstructor = URLComponents()
        urlConstructor.path = METHOD_PATH + API_NEWSFEED_GET
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
            URLQueryItem(name: "count", value: "1"),
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "start_from", value: "next_from"),
            URLQueryItem(name: "start_time", value: timeInterval1970)
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        let queue = OperationQueue()
        queue.addOperation {
            let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
                do {
                    print(Session.instance.token)
                    print(try JSONSerialization.jsonObject(with: data!, options: []))
                    let newsItemsResponse = try JSONDecoder().decode(NewsItemResponseContainer.self, from: data!)
                    print("LOADED NEWS")
                    controller.endRefreshNews(news: newsItemsResponse.response.items)
                } catch (let error) {
                    print(error)
                }
            }
            
            task.resume()
        }
    }
    
    static func saveMe() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = HTTPS_SCHEME
        urlConstructor.host = VK_HOST
        urlConstructor.path = METHOD_PATH + API_ACCOUNT_GET_PROFILE_INFO
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: VK_VERSION),
        ]
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        print("url \(urlConstructor.url!)")
        
        let task = session.dataTask(with: urlConstructor.url!) { data, response, error in
            do {
                let me = try JSONDecoder().decode(ProfileInfoModel.self, from: data!).response
                print("Info about me")
                print(me)
                Firebase().save(user: FirebaseLoginedUser(id: me.id, first_name: me.first_name, last_name: me.last_name))
            } catch (let error) {
                print("cannot get info about me")
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

