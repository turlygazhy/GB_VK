//
//  FriendsViewController+FillData.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController {
    
    func loadFriends() {
        NetworkManager.getFriends()//todo
        NetworkManager.getPhotos()
        NetworkManager.getGroups()
        NetworkManager.getGroups(query: "Sport")
    }
}
