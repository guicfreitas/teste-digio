//
//  ProductViewController.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class ProductViewController: UIViewController {
    // MARK: - Views
    private let productView = ProductView()

    // MARK: - Model
    private var productModel: ProductModel

    // MARK: - Initialization
    init(model: ProductModel) {
        self.productModel = model
        super.init(nibName: nil, bundle: nil)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        view = productView
    }

    func configureView() {
        productView.productImageView.downloaded(from: productModel.imageURL)
        productView.productDescription.text = productModel.description
        self.navigationItem.title = productModel.name
        productView.productImageView.layer.borderColor = productView.productImageView.image?.averageColor?.cgColor
    }
}
