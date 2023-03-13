//
//  UIViewControllerExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = nil, message: String?) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    func add(childViewController: UIViewController, parentView: UIView) {
        addChild(childViewController)
        parentView.addSubview(childViewController.view)
        childViewController.view.frame = parentView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
