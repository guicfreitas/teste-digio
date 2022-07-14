//
//  ProductCell.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class ProductCell: UICollectionViewCell {
    // MARK: - Views
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func layoutSubviews() {
        setupViewConfiguration()
    }
}
    // MARK: - ViewCode
extension ProductCell: ViewConfiguration {
    public func setupConstraints() {
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func buildViewHierarchy() {
        self.addSubview(bannerImageView)
    }
}
    // MARK: - Reuse Identifier
extension ProductCell {
    class var reuseIdentifier: String {
        String(describing: self)
    }
}
