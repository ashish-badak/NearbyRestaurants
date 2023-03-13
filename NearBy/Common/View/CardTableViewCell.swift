//
//  CardTableViewCell.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

protocol CellConfigurableView {
    associatedtype ViewModel
    func setData(_ viewModel: ViewModel)
    func prepareForReuse()
}

extension CellConfigurableView {
    func prepareForReuse() { }
}

class CardTableViewCell<View: UIView & CellConfigurableView>: UITableViewCell {
    private lazy var cardView: CardView = {
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var mainView: View = {
        let view = View()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainView.prepareForReuse()
    }
    
    func setupView() {
        cardView.addSubview(mainView)
        mainView.layoutConstraints(to: cardView)
        contentView.addSubview(cardView)
        cardView.layoutConstraints(
            to: contentView,
            top: .view(16),
            leading: .view(16),
            bottom: .view(16),
            trailing: .view(16)
        )
        
        mainView.roundCorners(radius: 10)
    }
    
    func setData(_ viewModel: View.ViewModel) {
        mainView.setData(viewModel)
    }
}
