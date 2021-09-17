//
//  MyGroupsTableViewCell.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 17.09.2021.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {

    static let identifier = "MyGroupsTableViewCell"
    
    @IBOutlet weak var groupName: UILabel!
    
    func configure(groupName: String) {
        self.groupName.text = groupName
    }

}
