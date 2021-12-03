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
    dynamic let height: Int
    dynamic let width: Int
    dynamic let url: String
}
