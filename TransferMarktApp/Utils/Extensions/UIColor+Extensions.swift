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
    case gray
    case selectedOrange
    case blue
    case darkBlue
    case lightGray2
}
extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
         return UIColor(named: name.rawValue)
    }
}
