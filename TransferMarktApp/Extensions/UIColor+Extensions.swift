//
//  UIColor+Extensions.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 16.04.2022.
//

import UIKit

enum AssetsColor: String {
    case pinkColor
    case whiteColor
    case selectedColor
    case backgroundColor
    case greenColor
    case grayColor
    case lightGray
}
extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
         return UIColor(named: name.rawValue)
    }
}
