//
//  AllGroupsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 23.10.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let fromAllGroupsToMyGoupsSegue = "fromAllGroupsToMyGoups"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       0 //todo
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
//        cell.configure(group: groups[indexPath.row]) todo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: fromAllGroupsToMyGoupsSegue, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
