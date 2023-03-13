//
//  BusinessDetailsBannerView.swift
//  NearBy
//
//  Created by Ashish Badak on 14/03/23.
//

import UIKit

typealias BusinessDetailsBannerTableViewCell = TableViewCell<BusinessDetailsBannerView>

final class BusinessDetailsBannerView: UIView, CellConfigurableView {
    typealias ViewModel = BusinessDetailBannerViewModel
    
    private var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.constrain(height: UIScreen.main.bounds.height * 0.65)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(bannerImageView)
        bannerImageView.constrainLeading()
        bannerImageView.constrainTrailing()
        let topConstraint = bannerImageView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 0
        )
        topConstraint.isActive = true
        topConstraint.priority = .init(rawValue: 999)
        let bottomContraint = bannerImageView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: 0
        )
        bottomContraint.isActive = true
        bottomContraint.priority = .init(rawValue: 999)
    }
    
    func setData(_ viewModel: BusinessDetailBannerViewModel) {
        Task {
            let (_, image) = await bannerImageView.downloadImage(from: viewModel.imageURL)
            bannerImageView.image = image
        }
    }
}
