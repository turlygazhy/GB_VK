//
//  FriendPageViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 19.10.2021.
//

import UIKit

class FriendPageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifierFriendCell = "FriendCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "FriendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifierFriendCell)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
}

extension FriendPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension FriendPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierFriendCell, for: indexPath) as! FriendCollectionViewCell
        if indexPath.row % 2 == 0 {
            cell.configure(image: UIImage(named: "vk-1"))
        } else {
            cell.configure(image: UIImage(named: "logo-instagram"))
        }
        return cell
    }
    
    
}
