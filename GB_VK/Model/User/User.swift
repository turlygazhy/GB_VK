//
//  User.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class User: Object, Codable {
    dynamic var id: Int
    dynamic var first_name: String
    dynamic var last_name: String
    dynamic var photo_100: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
