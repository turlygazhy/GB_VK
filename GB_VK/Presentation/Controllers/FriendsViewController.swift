//
//  BestFriendsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 15.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let openFriendGallerySegueName = "openFriendGallery"
    
    let friends = [
        Friend(name: "Gena", ava: UIImage(named: "ggg")!, photos: [UIImage(named: "ggg")!, UIImage(named: "g1")!,UIImage(named: "g2")!,UIImage(named: "g3")!]),
        Friend(name: "Khabib", ava: UIImage(named: "Habib")!, photos: [UIImage(named: "Habib")!,UIImage(named: "h1")!,UIImage(named: "h2")!,UIImage(named: "h3")!]),
        Friend(name: "Mike", ava: UIImage(named: "Mike")!, photos: [UIImage(named: "Mike")!,UIImage(named: "m1")!,UIImage(named: "m2")!,UIImage(named: "m3")!])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == openFriendGallerySegueName,
           let destinationVC = segue.destination as? GalleryViewController,
           let friend = sender as? Friend {
            destinationVC.photos = friend.photos
        }
    }
    
    func arrayLetter(sourceArray: [Friend]) -> [String] {
        var resultArray = [String]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1))
            if !resultArray.contains(nameLetter) {
                resultArray.append(nameLetter)
            }
        }
        return resultArray
    }
    
    func arrayByLetter(sourceArray: [Friend], letter: String) -> [Friend] {
        var resultArray = [Friend]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1))
            if nameLetter == letter {
                resultArray.append(item)
            }
        }
        return resultArray
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayByLetter(sourceArray: friends, letter: arrayLetter(sourceArray: friends)[section]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(friend: arrayByLetter(sourceArray: friends, letter: arrayLetter(sourceArray: friends)[indexPath.section])[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempRow = indexPath.row//todo remove line
        let tempSection = indexPath.section//todo 
        performSegue(withIdentifier: openFriendGallerySegueName, sender: friends[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        arrayLetter(sourceArray: friends).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        arrayLetter(sourceArray: friends)[section]
    }
}
