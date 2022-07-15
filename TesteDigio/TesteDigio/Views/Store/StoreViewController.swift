//
//  ViewController.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class StoreViewController: UIViewController {
    // MARK: - Views
    private let storeView = StoreView()

    // MARK: - Model
    private var storeViewModel = StoreViewModel()
    private var storeData: StoreModel? {
        didSet {
            DispatchQueue.main.async {
                self.storeView.productsCollectionView.reloadData()
                self.storeView.spotlightCollectionView.reloadData()
                self.storeView.bannerImageView.downloaded(from: self.storeData?.cash.bannerURL ?? "")
                self.storeView.cashTitle.text = self.storeData?.cash.title
            }
        }
    }

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        storeViewModel.makeData(completition: { store in
            self.storeData = store
        })
    }
    override func loadView() {
        view = storeView

        storeView.spotlightCollectionView.delegate = self
        storeView.spotlightCollectionView.dataSource = self

        storeView.productsCollectionView.delegate = self
        storeView.productsCollectionView.dataSource = self
    }
}

extension StoreViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let storeData = self.storeData else {
            return 0
        }
        if collectionView == storeView.spotlightCollectionView {
            return storeData.spotlight.count
        } else if collectionView == storeView.productsCollectionView {
            return storeData.products.count
        }

        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storeView.spotlightCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCell.reuseIdentifier,
                                                            for: indexPath) as? SpotlightCell else {
                return UICollectionViewCell()
            }
            cell.model = storeData?.spotlight[indexPath.row]

            return cell
        } else if collectionView == storeView.productsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseIdentifier,
                                                            for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            cell.model = storeData?.products[indexPath.row]

            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let storeData = storeData else {
            return
        }

        if collectionView == storeView.productsCollectionView {
            let productViewController = ProductViewController(model: storeData.products[indexPath.row])
            self.navigationController?.pushViewController(productViewController, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
