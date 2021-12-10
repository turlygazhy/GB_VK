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
    dynamic var count: Int = 0
    dynamic var items = List<User>()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(Int.self, forKey: .count)
        let itemsList = try container.decode([User].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }
    
    required override init() {
        super.init()
    }
}
