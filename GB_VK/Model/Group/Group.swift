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
    dynamic let groupDescription: String?
    dynamic let name: String
    dynamic let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case groupDescription = "description"
        case name
        case photoUrl = "photo_200"
    }
}
