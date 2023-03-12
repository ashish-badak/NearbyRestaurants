//
//  NearbyPlacesViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyPlacesViewController: UIViewController {
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
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
        view.addSubview(tableView)
        tableView.layoutConstraints()
    }
}

extension NearbyPlacesViewController: NearbyPlacesViewProtocol {
    func showLoading() {
        // - TODO: Show Loading
    }
    
    func hideLoading() {
        // - TODO: Hide Loading
    }
    
    func showError(message: String) {
        // - TODO: Show Error
        print("Error:", message)
    }
    
    func showNearbyPlaces() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showNewNearbyPlaces(newStartIndex: Int, newEndIndex: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let indexPaths: [IndexPath] = (newStartIndex...newEndIndex).map {
                IndexPath(row: $0, section: 0)
            }
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}
