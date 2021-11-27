//
//  FriendsResponse.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation

class FriendsResponse: Codable {
    let count: Int
    let items: [User]
}
