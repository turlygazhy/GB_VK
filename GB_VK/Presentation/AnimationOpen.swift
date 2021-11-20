//
//  LoginAnimation.swift
//  GB_VK
//
//  Created by Ерасыл Турлыгажы on 20.11.2021.
//

import UIKit

class AnimationOpen: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else {return}
        
        let containerFrame = transitionContext.containerView.frame
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = CGRect(x: containerFrame.width / 2, y: containerFrame.height / 2, width: 1, height: 1)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext)/2) {
            source.view.frame = CGRect(x: containerFrame.width / 2, y: containerFrame.height / 2, width: 0, height: 0)
        } completion: { isSuccessfully in
            if isSuccessfully {
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext)/2) {
                    destination.view.frame = CGRect(x: 0, y: 0, width: containerFrame.width, height: containerFrame.height)
                } completion: { isAllSuccessfully in
                    transitionContext    .completeTransition(isAllSuccessfully)
                }
            }
        }
    }
}
