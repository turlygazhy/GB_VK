//
//  MyGroupsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 17.09.2021.
//

import UIKit

class MyGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let myGroups = [Group(title: "GB", ava: UIImage(named: "gb")!), Group(title: "HP", ava: UIImage(named: "hp")!), Group(title: "apple", ava: UIImage(named: "apple")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openGroup" {
            let destinationViewController = segue.destination
            guard
            let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            destinationViewController.title = myGroups[indexSelectCell].title
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(group: myGroups[indexPath.row])
        return cell
    }
    
}
