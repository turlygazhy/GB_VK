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
    dynamic let id: Int
    dynamic let first_name: String
    dynamic let last_name: String
    dynamic let photo_100: String?
}
