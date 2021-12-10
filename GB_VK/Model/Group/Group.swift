//
//  Group.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class Group: Object, Codable {
    dynamic var groupDescription: String?
    dynamic var name: String
    dynamic var photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case groupDescription = "description"
        case name
        case photoUrl = "photo_200"
    }
}
