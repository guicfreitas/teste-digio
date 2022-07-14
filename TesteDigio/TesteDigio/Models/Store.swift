//
//  Store.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import Foundation

struct Store: Codable {
    var spotlight: [Spotlight]
    var products: [Product]
    var cash: Cash
}
