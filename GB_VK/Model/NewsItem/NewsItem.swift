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
    let date: Double
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
    
    func getPostPictureUrl() -> String? {
        return attachments?[0].photo?.sizes[0].url
    }
    
    func getStringDate() -> String? {
        let dateFormatter = DateFormatterVK()
        return dateFormatter.convertDate(timeIntervalSince1970: date)
    }
}

class DateFormatterVK {
    let dateFormatter = DateFormatter()
    
    func convertDate(timeIntervalSince1970: Double) -> String {
        dateFormatter.dateFormat = "MM-dd-yyyy HH.mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = Date(timeIntervalSince1970: timeIntervalSince1970)
        return dateFormatter.string(from: date)
    }
}
