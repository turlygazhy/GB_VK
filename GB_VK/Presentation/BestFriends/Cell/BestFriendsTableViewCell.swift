//
//  BestFriendsTableViewCell.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 15.09.2021.
//

import UIKit

class BestFriendsTableViewCell: UITableViewCell {
    
    static let identifier = "BestFriendsTableViewCell"
    
    @IBOutlet private var friendAva: UIImageView!
    @IBOutlet private var friendName: UILabel!
    
    func configure(friendAvaImageName: String, title: String) {
        friendAva.image = UIImage(named: friendAvaImageName)
        friendName.text = title
    }
    
}
