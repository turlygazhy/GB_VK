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
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
            print("-----------------------")
            print(realm.configuration.fileURL)
        } catch {
            print("could not save data \(friends)")
            print(error)
        }
    }
    
}
