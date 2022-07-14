//
//  StoreView.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class StoreView: UIView {
    // MARK: - Views
    private let spotlightCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.30)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(SpotlightCell.self, forCellWithReuseIdentifier: SpotlightCell.reuseIdentifier)
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    private let cashTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let productTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .preferredFont(forTextStyle: .title2)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.height * 0.20, height: UIScreen.main.bounds.height * 0.20)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseIdentifier)
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    // MARK: - Initialization
    public init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    // MARK: - ViewCode
extension StoreView: ViewConfiguration {
    public func setupConstraints() {
        makeSpotlightCollectionConstraints()
        makeCashTitleConstraints()
        makeBannerImageConstant()
        makeProductTitleConstraints()
        makeProductCollectionConstraints()	
    }

    func buildViewHierarchy() {
        self.addSubview(spotlightCollectionView)
        self.addSubview(cashTitle)
        self.addSubview(bannerImageView)
        self.addSubview(productTitle)
        self.addSubview(productsCollectionView)
    }

    func makeSpotlightCollectionConstraints() {
        spotlightCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            spotlightCollectionView.topAnchor.constraint(equalTo: self.topAnchor,
                                                    constant: .init(30).relatedToScreenHeight),
            spotlightCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                        constant: .init(20).relatedToScrenn),
            spotlightCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: .init(20).relatedToScrenn),
            spotlightCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25)
        ])
    }

    func makeCashTitleConstraints() {
        cashTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cashTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .init(20).relatedToScrenn),
            cashTitle.topAnchor.constraint(equalTo: spotlightCollectionView.bottomAnchor,
                                        constant: .init(30).relatedToScreenHeight)
        ])
    }

    func makeBannerImageConstant() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: cashTitle.bottomAnchor,
                                            constant: .init(10).relatedToScreenHeight),
            bannerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: .init(20).relatedToScrenn),
            bannerImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.20)
        ])
    }

    func makeProductTitleConstraints() {
        productTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .init(20).relatedToScrenn),
            productTitle.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor,
                                            constant: .init(30).relatedToScreenHeight)
        ])
    }

    func makeProductCollectionConstraints() {
        productsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productsCollectionView.topAnchor.constraint(equalTo: productTitle.bottomAnchor,
                                                    constant: .init(10).relatedToScreenHeight),
            productsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                        constant: .init(20).relatedToScrenn),
            productsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                        constant: .init(20).relatedToScrenn),
            productsCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                        constant: .init(20).relatedToScreenHeight),
            productsCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.25)
        ])
    }
}
