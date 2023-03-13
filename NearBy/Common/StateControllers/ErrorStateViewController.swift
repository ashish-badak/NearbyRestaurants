//
//  ErrorStateViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

final class ErrorStateViewController: UIViewController {
    private var errorMessage: String
    
    private var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setErrorLabel()
    }
    
    private func setErrorLabel() {
        errorLabel.text = errorMessage
        view.addSubview(errorLabel)
        errorLabel.constrainLeading(bound: .view(20))
        errorLabel.constrainTrailing(bound: .view(20))
        errorLabel.pinVertically()
    }
}
