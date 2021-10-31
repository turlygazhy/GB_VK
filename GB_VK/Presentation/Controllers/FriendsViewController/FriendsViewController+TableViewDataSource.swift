//
//  FriendsViewController+CollectionDataSource.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 28.10.2021.
//

import UIKit

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayByLetter(sourceArray: friends, letter: arrayLetter(sourceArray: friends)[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(friend: arrayByLetter(sourceArray: friends, letter: arrayLetter(sourceArray: friends)[indexPath.section])[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arrayLetter(sourceArray: friends).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        arrayLetter(sourceArray: friends)[section]
    }
}
