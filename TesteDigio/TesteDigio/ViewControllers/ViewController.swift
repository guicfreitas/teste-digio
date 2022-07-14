//
//  ViewController.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit

class ViewController: UIViewController {
    let storeViewModel = StoreViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        storeViewModel.makeData()
        // Do any additional setup after loading the view.
    }
}
