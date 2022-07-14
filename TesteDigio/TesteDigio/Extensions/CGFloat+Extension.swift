//
//  CGFloat+Extension.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import UIKit
struct IphoneConstants {
    static let width: CGFloat = 428.0
    static let height: CGFloat = 926.0
}

extension CGFloat {
    var relatedToScrenn: CGFloat {
        (self) * UIScreen.main.bounds.width / IphoneConstants.width
    }

    var relatedToScreenHeight: CGFloat {
        (self) * UIScreen.main.bounds.height / IphoneConstants.height
    }
}
