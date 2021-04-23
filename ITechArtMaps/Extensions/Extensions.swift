//
//  Extensions.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import Foundation
import UIKit

public extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let roundedLayer = CAShapeLayer()
        roundedLayer.path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
            ).cgPath
        layer.mask = roundedLayer
    }
    
    func fadeTo(
        _ alpha: CGFloat,
        duration: TimeInterval = 0.3,
        delay: TimeInterval = 0,
        completion: (() -> Void)? = nil) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: .curveEaseInOut,
            animations: {
                self.alpha = alpha
        },
            completion: nil
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        fadeTo(1, duration: duration, delay: delay, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: (() -> Void)? = nil) {
        fadeTo(0, duration: duration, delay: delay, completion: completion)
    }
}


//--------------------------------------------------
// MARK: - UIViewController
//--------------------------------------------------
public extension UIViewController {
    func presentBottomSheet(_ bottomSheet: BottomSheetViewController, completion: (() -> Void)?) {
        self.present(bottomSheet, animated: false, completion: completion)
    }
}
