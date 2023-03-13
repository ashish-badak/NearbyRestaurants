//
//  ActivityStateViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit


final class ActivityStateViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.hidesWhenStopped = true
        return activityView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            removeActivityIndicator()
        }
    }
    
    override func didMove(toParent parent: UIViewController?) {
        if parent != nil {
            showActivityIndicator()
        }
    }
    
    deinit {
        removeActivityIndicator()
    }
    
    private func showActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func removeActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
