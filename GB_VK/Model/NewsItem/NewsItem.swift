//
//  NewsItem.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 03.02.2022.
//

import Foundation
import UIKit

struct NewsItem: Codable {
    let text: String
    let comments: Comments
    let likes: Likes
    let reposts: Reposts
    let views: Views?
    let attachments: [Attachment]?
    
    func getPostText() -> String {
        return text
    }
    
    func getCommentsCount() -> Int {
        return comments.count
    }
    
    func getLikesCount() -> Int {
        return likes.count
    }
    
    func getRepostsCount() -> Int {
        return reposts.count
    }
    
    func getViewsCount() -> Int {
        return views?.count ?? 0
    }
    
    func getUserName() -> String {
        return attachments?[0].link?.caption ?? "TODO"
    }
    
    func getPostPictureUrl() -> String {
        return attachments?[0].link?.photo.sizes[0].url ?? "TODO"
    }
    
//    let userAva: UIImage
}
