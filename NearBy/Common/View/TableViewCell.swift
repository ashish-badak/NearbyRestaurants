//
//  TableViewCell.swift
//  NearBy
//
//  Created by Ashish Badak on 14/03/23.
//

import UIKit

class TableViewCell<View: UIView & CellConfigurableView>: UITableViewCell {
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
    
    private func setupView() {
        contentView.addSubview(mainView)
        mainView.layoutConstraints(to: contentView)
    }
    
    func setData(_ viewModel: View.ViewModel) {
        mainView.setData(viewModel)
    }
}
