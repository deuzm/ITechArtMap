//
//  BottomSheetModel.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//


import Foundation
import UIKit

public struct BottomSheetViewModel:
    BottomSheetPresentable {
   
    public var cornerRadius: CGFloat
    public var animationTransitionDuration: TimeInterval
    public var backgroundColor: UIColor
    
    public init() {
        cornerRadius = 20
        animationTransitionDuration = 0.3
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    public init(cornerRadius: CGFloat,
                animationTransitionDuration: TimeInterval,
                backgroundColor: UIColor ) {
        
        self.cornerRadius = cornerRadius
        self.animationTransitionDuration = animationTransitionDuration
        self.backgroundColor = backgroundColor
    }
}
