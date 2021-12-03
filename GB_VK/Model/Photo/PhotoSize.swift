//
//  PhotoSize.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.11.2021.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
class PhotoSize: Object, Codable {
    dynamic var height: Int
    dynamic var width: Int
    dynamic var url: String
}
