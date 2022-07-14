//
//  ViewController.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class StoreViewController: UIViewController {
    let storeViewModel = StoreViewModel()
    var storeData: Store?

    override func viewDidLoad() {
        super.viewDidLoad()
        storeViewModel.makeData { storeData in
            self.storeData = storeData
        }
    }
}
