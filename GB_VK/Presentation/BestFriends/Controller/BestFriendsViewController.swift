//
//  BestFriendsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 15.09.2021.
//

import UIKit

class BestFriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let friends = [Friend(name: "Gena", ava: UIImage(named: "ggg")!, photos: [UIImage(named: "ggg")!]), Friend(name: "Khabib", ava: UIImage(named: "Habib")!, photos: [UIImage(named: "Habib")!]), Friend(name: "Mike", ava: UIImage(named: "Mike")!, photos: [UIImage(named: "Mike")!])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriendDetail" {
            let destinationViewController = segue.destination
            guard
            let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            destinationViewController.title = friends[indexSelectCell].name
        }
    }
    
}

extension BestFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(friend: friends[indexPath.row])
        
        return cell
    }
    
    
}
