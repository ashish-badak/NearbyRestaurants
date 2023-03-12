//
//  NearbyPlacesViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyPlacesViewController: UIViewController {
    
    private var presenter: NearbyPlacesPresenterProtocol
    
    init(presenter: NearbyPlacesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        // - TODO: setup view components
    }
}

extension NearbyPlacesViewController: NearbyPlacesViewProtocol {
    
}
