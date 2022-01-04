//
//  FirebaseModels.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 02.01.2022.
//

import Foundation
import UIKit
import Firebase

class FirebaseLoginedUser {
    let id: Int
    let first_name: String
    let last_name: String
    let ref: DatabaseReference?
    
    init(id: Int, first_name: String, last_name: String){
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.ref = nil
    }
    
    init?(snapshot: DataSnapshot) {//todo parsing should be by codable
        guard let value = snapshot.value as? [String: Any],
              let id = value["id"] as? Int,
              let first_name = value["first_name"] as? String,
              let last_name = value["last_name"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
    }
    
    func toDict() -> [String: Any] {
        return [
            "id": id,
            "first_name":first_name,
            "last_name":last_name,
        ]
    }
}
