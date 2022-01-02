//
//  Firebase.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 27.12.2021.
//

import Foundation
import FirebaseDatabase

class Firebase {
    
    private let ref = Database.database(url: "https://simplelogin-37a99-default-rtdb.europe-west1.firebasedatabase.app").reference(withPath: "loginedUsers")
    
     func save(user: FirebaseLoginedUser) {
        let userRef = self.ref.child(user.first_name.lowercased())
        userRef.setValue(user.toDict())
    }
}
