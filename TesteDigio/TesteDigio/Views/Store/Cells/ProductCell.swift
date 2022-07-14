//
//  ProductCell.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class ProductCell: UICollectionViewCell {
    // MARK: - Model
    var model: ProductModel? {
        didSet {
            guard let model = model else {
                return
            }

            bannerImageView.downloaded(from: model.imageURL)
        }
    }
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
            bannerImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bannerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bannerImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.10),
            bannerImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.10)
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
