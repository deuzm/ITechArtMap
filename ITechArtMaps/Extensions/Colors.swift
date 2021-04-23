//
//  Colors.swift
//  ITechArtMaps
//
//  Created by Лиза  Малиновская on 4/23/21.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
           let r, g, b, a: CGFloat

           if hex.hasPrefix("#") {
               let start = hex.index(hex.startIndex, offsetBy: 1)
               let hexColor = String(hex[start...])

               if hexColor.count == 8 {
                   let scanner = Scanner(string: hexColor)
                   var hexNumber: UInt64 = 0

                   if scanner.scanHexInt64(&hexNumber) {
                       r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                       g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                       b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                       a = CGFloat(hexNumber & 0x000000ff) / 255

                       self.init(red: r, green: g, blue: b, alpha: a)
                       return
                   }
               }
           }

           return nil
       }
    
    struct ITechArtColors {
        static let Blue = UIColor(red: 0.121, green: 0, blue: 0.863, alpha: 1)
        static let WhiteBackground = UIColor(red: 0.965, green: 0.969, blue: 0.984, alpha: 1)
        static let TextGrey = UIColor(red: 0.358, green: 0.358, blue: 0.358, alpha: 1)
        static let Black = UIColor(red: 0.146, green: 0.146, blue: 0.146, alpha: 1)
    }
}
