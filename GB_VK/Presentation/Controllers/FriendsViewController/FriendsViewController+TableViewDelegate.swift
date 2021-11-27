//
//  FriendsViewController+CollectionDelegate.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       performSegue(withIdentifier: openFriendGallerySegueName, sender: arrayByLetter(sourceArray: friends, letter: arrayLetter(sourceArray: friends)[indexPath.section])[indexPath.row]) todo
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
