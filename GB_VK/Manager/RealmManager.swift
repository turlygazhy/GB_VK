//
//  RealmManager.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 10.12.2021.
//

import Foundation
import Realm
import RealmSwift

class RealmManager {
    
    func save(friends: [User]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)//todo where this line should be?
            let realm = try Realm(configuration: config)
            realm.beginWrite()
            realm.add(friends, update: .all)
            try realm.commitWrite()
            print("-----------------------")
            print(realm.configuration.fileURL)
        } catch {
            print("could not save data \(friends)")
            print(error)
        }
    }
    
    func readFriends() -> [User]? {
        do {
            let realm = try Realm()
            let friends = realm.objects(User.self)
            print("Got from DB friends")
            print(friends)
            return Array(friends)
        } catch {
            
        }
        return nil
    }
    
}
