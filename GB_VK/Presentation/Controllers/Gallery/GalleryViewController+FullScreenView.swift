//
//  GalleryViewController+FullScreenView.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 12.11.2021.
//

import UIKit

extension GalleryViewController {
    
    func showView(image: UIImage?) {
        fullScreenView = UIView(frame: self.view.bounds)
        fullScreenView!.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = fullScreenView!.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        fullScreenView?.addSubview(blurEffectView)
        
        self.view.addSubview(fullScreenView!)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        fullScreenView!.addGestureRecognizer(tapRecognizer)
        
        let imageView = UIImageView(image: galleryView.getCurrentImage())
        fullScreenView?.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: fullScreenView!.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: fullScreenView!.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: fullScreenView!.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: fullScreenView!.widthAnchor).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
    
    @objc func onTap() {
        guard let fullScreenView = self.fullScreenView else { return }
        fullScreenView.removeFromSuperview()
    }
    
}
