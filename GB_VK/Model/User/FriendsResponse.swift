//
//  FriendsResponse.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class FriendsResponse: Object, Codable {
    dynamic let count: Int
    dynamic let items: [User]
}
