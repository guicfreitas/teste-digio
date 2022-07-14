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
        let label: UILabel
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

    //MARK: - Initialization
    public init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StoreView: ViewConfiguration {
    func buildViewHierarchy() {
        
    }

    public func setupConstraints() {
        
    }
}
