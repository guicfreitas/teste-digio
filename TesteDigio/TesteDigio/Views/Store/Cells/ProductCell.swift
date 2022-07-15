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
        imageView.image = UIImage(named: "noImage")
        return imageView
    }()

    override func layoutSubviews() {
        setupViewConfiguration()
        setUpAditionalConfiguration()
        self.backgroundColor = .white
        layer.shadowPath = UIBezierPath(
                    roundedRect: bounds,
                    cornerRadius: 10
                ).cgPath
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

    func setUpAditionalConfiguration() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true

        layer.cornerRadius = 10
        layer.masksToBounds = false

        layer.shadowRadius = 2.5
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
    // MARK: - Reuse Identifier
extension ProductCell {
    class var reuseIdentifier: String {
        String(describing: self)
    }
}
