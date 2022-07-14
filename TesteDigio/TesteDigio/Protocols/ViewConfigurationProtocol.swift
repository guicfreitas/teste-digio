//
//  ViewConfigurationProtocol.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import Foundation

public protocol ViewConfiguration: AnyObject {
    func setupConstraints()
    func buildViewHierarchy()
    func setupViewConfiguration()
}
