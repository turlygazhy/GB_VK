//
//  GalleryCollectionViewCell.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 25.10.2021.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
   
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func configure(photo: UIImage){
        photoImageView.image = photo
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
