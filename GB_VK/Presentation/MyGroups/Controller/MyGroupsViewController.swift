//
//  MyGroupsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 17.09.2021.
//

import UIKit

class MyGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let myGroups = ["GB", "Apple", "HP"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openGroup" {
            let destinationViewController = segue.destination
            guard
            let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            destinationViewController.title = myGroups[indexSelectCell]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyGroupsTableViewCell.identifier) as! MyGroupsTableViewCell
        cell.configure(groupName: myGroups[indexPath.row])
        return cell
    }
    
}
