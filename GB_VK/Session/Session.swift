//
//  Session.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 23.11.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    var token: String = ""
    var userId: Int = 0
    
    private init() { }
}
