//
//  FriendsViewController+CollectionDelegate.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempRow = indexPath.row//todo remove line
        let tempSection = indexPath.section//todo
        performSegue(withIdentifier: openFriendGallerySegueName, sender: friends[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
