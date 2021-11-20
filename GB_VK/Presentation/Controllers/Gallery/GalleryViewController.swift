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
    
    var fullScreenView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryView.setImages(images: photos)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapToImage))
        galleryView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func onTapToImage() {
        showView(image: nil)//todo should not be nil
    }
    
}
