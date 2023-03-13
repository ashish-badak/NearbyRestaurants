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
        tableView.separatorStyle = .none
        tableView.register(NearbyPlaceCardTableViewCell.self)
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
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.layoutConstraints()
        tableView.dataSource = self
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
}

extension NearbyPlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfViewModels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NearbyPlaceCardTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.mainView.setData(presenter.getViewModel(atIndex: indexPath.row))
        return cell
    }
}
