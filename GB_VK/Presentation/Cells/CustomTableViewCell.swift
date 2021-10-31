//
//  CustomTableViewCell.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 22.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var liked = false
    
    @IBAction func pressLike(_ sender: Any) {
        if liked {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        liked = !liked
    }
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        titleLabel.text = nil
        liked = false
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    func configure(friend: Friend) {
        avatarImageView.image = friend.ava
        titleLabel.text = friend.name
    }
    
    func configure(group: Group) {
        avatarImageView.image = group.ava
        titleLabel.text = group.title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
