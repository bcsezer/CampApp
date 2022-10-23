//
//  UIView+Extensions.swift
//  CampApp
//
//  Created by cem sezeroglu on 23.10.2022.
//

import UIKit

extension UIView {
    
    enum RoundCornersAt {
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
    func roundCorners(corners: [RoundCornersAt], radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [
            corners.contains(.topRight) ? .layerMaxXMinYCorner:.init(),
            corners.contains(.topLeft) ? .layerMinXMinYCorner:.init(),
            corners.contains(.bottomRight) ? .layerMaxXMaxYCorner:.init(),
            corners.contains(.bottomLeft) ? .layerMinXMaxYCorner:.init(),
        ]
    }
    
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
            self.isHidden = false
        })
    }
    
    
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
            self.isHidden = true
        })
    }
}
