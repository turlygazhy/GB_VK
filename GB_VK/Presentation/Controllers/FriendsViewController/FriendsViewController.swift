//
//  BestFriendsViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 15.09.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let openFriendGallerySegueName = "openFriendGallery"
    var friends = [Friend]()
    var savedFriends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillFriends()
        savedFriends = friends
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        self.navigationController?.delegate = self
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

extension FriendsViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return AnimationOpen()
        }
        return nil
    }
    
}
