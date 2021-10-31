//
//  FriendsViewController+UISearchBarDelegate.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.friends = savedFriends
        } else {
            self.friends = self.friends.filter { friend in
                friend.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        self.tableView.reloadData()
    }
}
