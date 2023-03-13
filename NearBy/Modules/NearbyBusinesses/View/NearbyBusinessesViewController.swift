//
//  NearbyBusinessesViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyBusinessesViewController: UIViewController {
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
    
    private lazy var activityIndicatorView =  ActivityStateViewController()

    private var presenter: NearbyBusinessesPresenterProtocol
    
    init(presenter: NearbyBusinessesPresenterProtocol) {
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
        tableView.delegate = self
    }
}

extension NearbyBusinessesViewController: NearbyBusinessesViewProtocol {
    func showLoading() {
        DispatchQueue.main.async {
            self.add(childViewController: self.activityIndicatorView, parentView: self.view)
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicatorView.remove()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let errorController = ErrorStateViewController(errorMessage: message)
            self.add(
                childViewController: errorController,
                parentView: self.view
            )
        }
    }
    
    func showNearbyBusinesses() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension NearbyBusinessesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getNumberOfViewModels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NearbyPlaceCardTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.mainView.setData(presenter.getViewModel(atIndex: indexPath.row))
        return cell
    }
}

extension NearbyBusinessesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.placeDidTap(at: indexPath.row)
    }
}
