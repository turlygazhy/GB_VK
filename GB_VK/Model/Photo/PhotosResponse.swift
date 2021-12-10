//
//  PhotosResponse.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class PhotosResponse: Object, Codable {
    dynamic var items = List<Photo>()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let itemsList = try container.decode([Photo].self, forKey: .items)
        items.append(objectsIn: itemsList)
        super.init()
    }
    
    required override init() {
        super.init()
    }
}
