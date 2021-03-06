//
//  MyGroupsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 17.09.2021.
//

import UIKit

class MyGroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let fromAllGroupsToMyGoupsSegue = "fromAllGroupsToMyGoups"
    
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
            
//            destinationViewController.title = myGroups[indexSelectCell].title
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    @IBAction func unwindSegueToMyGroup(segue: UIStoryboardSegue){
//        if segue.identifier == fromAllGroupsToMyGoupsSegue,
//           let sourceVC = segue.source as? AllGroupsViewController,
//           let selectedGroup = sourceVC.selectedGroup
//        {
//            if !isGroupExist(group: selectedGroup) {
//                self.myGroups.append(selectedGroup)
//            }
//            tableView.reloadData()
//        }
    }
    
}
