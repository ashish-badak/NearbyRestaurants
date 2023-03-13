//
//  BusinessDetailsViewController.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

final class BusinessDetailsViewController: UIViewController {
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(BusinessDetailsBannerTableViewCell.self)
        tableView.register(BusinessDetailsInfoTableViewCell.self)
        return tableView
    }()
    
    private lazy var activityIndicatorView =  ActivityStateViewController()

    private var presenter: BusinessDetailsPresenterProtocol
    
    init(presenter: BusinessDetailsPresenterProtocol) {
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


extension BusinessDetailsViewController: BusinessDetailsViewProtocol {
    func showLoading() {
        DispatchQueue.main.async {
            self.add(
                childViewController: self.activityIndicatorView,
                parentView: self.view
            )
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
    
    func showBusinessDetails() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension BusinessDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfViewModels()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemViewModel = presenter.getViewModel(atIndex: indexPath.row)
        
        if let viewModel = itemViewModel as? BusinessDetailBannerViewModel {
            return getBannerCell(for: indexPath, viewModel: viewModel)
        } else if let viewModel = itemViewModel as? BusinessDetailsInfoViewModel {
            return getInfoCell(for: indexPath, viewModel: viewModel)
        }
        
        return UITableViewCell()
    }
    
    private func getBannerCell(
        for indexPath: IndexPath,
        viewModel: BusinessDetailBannerViewModel
    ) -> BusinessDetailsBannerTableViewCell {
        let cell: BusinessDetailsBannerTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.setData(viewModel)
        return cell
    }
    
    private func getInfoCell(
        for indexPath: IndexPath,
        viewModel: BusinessDetailsInfoViewModel
    ) -> BusinessDetailsInfoTableViewCell {
        let cell: BusinessDetailsInfoTableViewCell = tableView.dequeueCell(for: indexPath)
        cell.setData(viewModel)
        return cell
    }
}
