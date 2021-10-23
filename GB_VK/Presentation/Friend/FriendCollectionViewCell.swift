//
//  FriendCollectionViewCell.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 19.10.2021.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!
    
    override func prepareForReuse() {
        myImage.image = nil
    }
    
    func configure(image: UIImage?){
        myImage.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
