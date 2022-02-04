//
//  NewsItem.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 03.02.2022.
//

import Foundation
import UIKit

struct NewsItem {
    let userAva: UIImage
    let username: String
    let postText: String?
    let postPicture: UIImage?
    let likeCount: Int
    let commentCount: Int
    let repostCount: Int
    let viewCount: Int
}
