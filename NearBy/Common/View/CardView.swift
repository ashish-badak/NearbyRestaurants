//
//  CardView.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

final class CardView: UIView {
    override var bounds: CGRect {
        didSet {
            if oldValue == bounds { return }
            ///Calling this everytime bounds set so that shadow is also adjusted according to new bounds.
            castShadow()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadowStyle(.card)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func castShadow() {
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(
                width: self.layer.cornerRadius,
                height: 0.5
            )
        ).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setShadowStyle(_ style: ShadowStyle) {
        layer.shadowColor = style.shadowColor.cgColor
        layer.shadowOffset = style.shadowOffset
        layer.shadowOpacity = style.shadowOpacity
        layer.shadowRadius = style.shadowRadius
        layer.cornerRadius = style.cornerRadius
    }
}
