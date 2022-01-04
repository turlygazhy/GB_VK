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
    
    var friends = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        NetworkManager.initFriends(controller: self)
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        self.navigationController?.delegate = self
       
//        let friends = RealmManager().readFriends(friendsViewController: self) todo
//        if friends != nil && !friends!.isEmpty {
//            self.friends = friends!
//            self.tableView.reloadData()
//        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {//todo I could not call realm saving from not main thread and put it here
//        if !friends.isEmpty { todo
//            RealmManager().save(friends: friends)
//        }
    }
    
    func setFriends(friends: [User]) {
        DispatchQueue.main.async {
            self.friends = friends
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == openFriendGallerySegueName,todo
        //           let destinationVC = segue.destination as? GalleryViewController,
        //           let friend = sender as? Friend {
        //            destinationVC.photos = friend.photos
        //        }
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
