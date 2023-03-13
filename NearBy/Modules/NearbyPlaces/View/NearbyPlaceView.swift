//
//  NearbyPlaceView.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

typealias NearbyPlaceCardTableViewCell = CardTableViewCell<NearbyPlaceView>

final class NearbyPlaceView: UIView, CardCellConfigurableView {
    typealias ViewModel = NearbyPlaceViewModel
    
    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.constrain(height: 180)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.stylise(.title)
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.stylise(.regular)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.stylise(.regular)
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
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
    
    func prepareForReuse() {
        imageURL = nil
    }
    
    private func setupView() {
        backgroundColor = UIColor.Background.cards
        
        addSubview(placeImageView)
        placeImageView.constrainTop()
        placeImageView.constrainLeading()
        placeImageView.constrainTrailing()
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(ratingLabel)
        contentStackView.addArrangedSubview(priceLabel)
        
        addSubview(contentStackView)
        
        contentStackView.topAnchor.constraint(
            equalTo: placeImageView.bottomAnchor,
            constant: 16
        ).isActive = true
        contentStackView.constrainLeading(bound: .view(16))
        contentStackView.constrainBottom(bound: .view(16))
        contentStackView.constrainTrailing(bound: .view(16))
    }
    
    func setData(_ viewModel: NearbyPlaceViewModel) {
        titleLabel.text = viewModel.name
        ratingLabel.text = viewModel.rating
        priceLabel.text = viewModel.price
        priceLabel.isHidden = viewModel.price == nil
        imageURL = viewModel.imageURL
        Task {
            let (url, image) = await placeImageView.downloadImage(from: viewModel.imageURL)
            if url == imageURL {
                placeImageView.image = image
            }
        }
    }
}
