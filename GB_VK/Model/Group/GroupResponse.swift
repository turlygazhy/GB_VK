//
//  GroupResponse.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class GroupResponse: Object, Codable {
    dynamic var items = List<Group>()

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let itemsList = try container.decode([Group].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }

    required override init() {
        super.init()
    }
}
