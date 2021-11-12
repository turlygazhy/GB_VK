//
//  FriendPageViewController.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 19.10.2021.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryView: GalleryHorisontalView!
    
    var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryView.setImages(images: photos)
    }
    
}
