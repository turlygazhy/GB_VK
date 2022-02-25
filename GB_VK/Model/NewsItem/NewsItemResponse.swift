//
//  NewsItemResponse.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 08.02.2022.
//

import Foundation

struct NewsItemResponse: Codable {
    let items: [NewsItem]
    let profiles: [User]
    let groups: [Group]
    let next_form: String?
}
