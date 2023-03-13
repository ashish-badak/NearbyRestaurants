//
//  ShadowStyle.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

struct ShadowStyle {
    var cornerRadius: CGFloat
    var shadowRadius: CGFloat
    var shadowOpacity: Float
    var shadowColor: UIColor = UIColor.NP.shadowColor
    var shadowOffset: CGSize = .zero
}

extension ShadowStyle {
    static var card: ShadowStyle {
        ShadowStyle(cornerRadius: 10, shadowRadius: 5, shadowOpacity: 0.7)
    }
}
