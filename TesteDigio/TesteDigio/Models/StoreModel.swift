//
//  Store.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import Foundation

struct StoreModel: Codable {
    var spotlight: [SpotlightModel]
    var products: [ProductModel]
    var cash: CashModel
}
