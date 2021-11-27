//
//  Group.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation

class Group: Codable {
    let description: String?
    let name: String
    let photo_200: String
    
    func getPhotoUrl() -> String {
        photo_200
    }
}
