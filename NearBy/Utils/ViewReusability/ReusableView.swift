//
//  ReusableView.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseId: String { String(describing: self) }
}

extension UITableViewCell: ReusableView { }
