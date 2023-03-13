//
//  BusinessDetailsInfoView.swift
//  NearBy
//
//  Created by Ashish Badak on 14/03/23.
//

import UIKit

typealias BusinessDetailsInfoTableViewCell = TableViewCell<BusinessDetailsInfoView>

final class BusinessDetailsInfoView: UIView, CellConfigurableView {
    typealias ViewModel = BusinessDetailsInfoViewModel
 
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.stylise(.regular)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.stylise(.regular)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .top
        view.distribution = .fill
        return view
    }()
    
    private var imageURL: URL?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.Background.cards
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        addSubview(contentStackView)
        contentStackView.layoutConstraints(
            top: .view(16),
            leading: .view(16),
            bottom: .view(16),
            trailing: .view(16)
        )
    }
    
    func setData(_ viewModel: BusinessDetailsInfoViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.info
    }
}
