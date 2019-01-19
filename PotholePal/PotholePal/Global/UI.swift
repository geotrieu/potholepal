//
//  UI.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//


import Foundation
import UIKit

struct UI {
    struct Colors {
        static let neonBlue = UIColor(hexValue: 0x409BFF)
        
        static let red = UIColor(hexValue: 0xE05C6C)
        static let white = UIColor.white
        static let black = UIColor.black
        static let blue = UIColor(hexValue: 0x58A6FF)
        static let lightGrey = UIColor(hexValue: 0xC8C8C8)
        static let lightestGrey = UIColor(hexValue: 0xD6D9DE)
        static let backgroundColor = UIColor(hexValue: 0xFCFCFC)
        static let grey = UIColor(hexValue: 929292)
    }
    
    struct Font {
        
        static func ultraLight(_ size: CGFloat = 12) -> UIFont {
            return UIFont(name: "AvenirNext-UltraLight", size: size)!
        }
        
        static func regular(_ size: CGFloat = 12) -> UIFont {
            return UIFont(name: "AvenirNext-Regular", size: size)!
        }
        
        static func medium(_ size: CGFloat = 12) -> UIFont {
            return UIFont(name: "AvenirNext-Medium", size: size)!
        }
        
        static func demiBold(_ size: CGFloat = 12) -> UIFont {
            return UIFont(name: "AvenirNext-DemiBold", size: size)!
        }
    }
}
