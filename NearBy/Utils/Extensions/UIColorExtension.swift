//
//  UIColorExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

extension UIColor {
    enum NP {
        static var shadowColor: UIColor { .systemGray }
        
        static var primaryBackgroundColor: UIColor {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return UIColor.systemBackground
                } else {
                    /// Return the color for Light Mode
                    return UIColor.secondarySystemBackground
                }
            }
        }
        
        static var contentBackgroundColor: UIColor {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return UIColor.secondarySystemBackground
                } else {
                    /// Return the color for Light Mode
                    return UIColor.systemBackground
                }
            }
        }
    }
    
    enum Background {
        static var lists: UIColor { UIColor.NP.primaryBackgroundColor }
        static var cards: UIColor { UIColor.NP.contentBackgroundColor }
    }

    enum Font {
        static var primary: UIColor {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    return UIColor.label
                } else {
                    /// Return the color for Light Mode
                    return UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
                }
            }
        }
    }
}

