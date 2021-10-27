//
//  AllGroupsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 23.10.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let groups = [Group(title: "GB", ava: UIImage(named: "gb")!), Group(title: "HP", ava: UIImage(named: "hp")!), Group(title: "apple", ava: UIImage(named: "apple")!), Group(title: "Mail.ru", ava: UIImage(named: "mailru")!)]
    
    let fromAllGroupsToMyGoupsSegue = "fromAllGroupsToMyGoups"
    var selectedGroup: Group?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(group: groups[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGroup = groups[indexPath.row]
        performSegue(withIdentifier: fromAllGroupsToMyGoupsSegue, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
