//
//  TextStyle.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

extension UILabel {
    func stylise(_ textStyle: TextStyle) {
        font = textStyle.font
        textColor = textStyle.color
    }
}

struct TextStyle {
    let font: UIFont
    let color: UIColor
}

extension TextStyle {
    static var title: TextStyle {
        .init(font: UIFont.NP.title, color: UIColor.Font.primary)
    }
    
    static var regular: TextStyle {
        .init(font: UIFont.NP.regular, color: UIColor.Font.primary)
    }
}
