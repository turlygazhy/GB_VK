//
//  FriendsViewController+FillData.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController {
    
    func fillFriends() {
        friends.append(Friend(name: "Gena", ava: UIImage(named: "ggg")!, photos: [UIImage(named: "ggg")!, UIImage(named: "g1")!,UIImage(named: "g2")!,UIImage(named: "g3")!]))
        friends.append(Friend(name: "Khabib", ava: UIImage(named: "Habib")!, photos: [UIImage(named: "Habib")!,UIImage(named: "h1")!,UIImage(named: "h2")!,UIImage(named: "h3")!]))
        friends.append(Friend(name: "Mike", ava: UIImage(named: "Mike")!, photos: [UIImage(named: "Mike")!,UIImage(named: "m1")!,UIImage(named: "m2")!,UIImage(named: "m3")!]))
    }
    
}
