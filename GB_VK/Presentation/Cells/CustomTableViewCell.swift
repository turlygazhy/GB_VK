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
    
    func configure(friend: User) {
        titleLabel.text = friend.first_name + " " + friend.last_name
        
        if friend.photo_100 == nil {
            return
        }
        
//        DispatchQueue.global().async { [weak self] in //todo does not work when read from realm
//            if let data = try? Data(contentsOf: URL(string: friend.photo_100!)!) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self!.avatarImageView.image = image
//                    }
//                }
//            }
//        }
        
    }
//
//    func configure(group: Group) {
//        avatarImageView.image = group.ava
//        titleLabel.text = group.title
//    } todo
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func pressAvatarButton(_ sender: Any) {
        let scale = CGFloat(10)
        
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self = self else {return}
            
            self.avatarImageView.frame = CGRect(x: self.avatarImageView.frame.origin.x + scale/2, y: self.avatarImageView.frame.origin.y + scale/2, width: self.avatarImageView.frame.width - scale, height: self.avatarImageView.frame.height - scale)
        } completion: { isSuccess in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.7,
                           options: []) { [weak self] in
                guard let self = self else {return}
                
                self.avatarImageView.frame = CGRect(x: self.avatarImageView.frame.origin.x - scale/2, y: self.avatarImageView.frame.origin.y - scale/2, width: self.avatarImageView.frame.width + scale, height: self.avatarImageView.frame.height + scale)
            } completion: { _ in
            }

        }
        
        
        
    }
}
