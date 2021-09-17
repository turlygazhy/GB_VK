//
//  BestFriendsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 15.09.2021.
//

import UIKit

class BestFriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let friends = ["Ivan", "Sergey", "Lena"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendDetail" {
            let destinationViewController = segue.destination
            guard
            let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            destinationViewController.title = friends[indexSelectCell]
        }
    }
    
}

extension BestFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BestFriendsTableViewCell.identifier) as! BestFriendsTableViewCell
        cell.configure(friendAvaImageName: "vk-1", title: friends[indexPath.row])
        return cell
    }
    
    
}
