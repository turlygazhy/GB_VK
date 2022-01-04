//
//  Group.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation

class Group: Codable {
    let groupDescription: String?
    let name: String
    let photoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case groupDescription = "description"
        case name
        case photoUrl = "photo_200"
    }
}
