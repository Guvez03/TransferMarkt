//
//  Int+Extension.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 13.06.2022.
//

import Foundation

extension Int {
    func formatPoints() -> Double {
        let number = Double(self)
        let thousand = number / 10000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return round(billion*10)/10
        } else if million >= 1.0 {
            return round(million*10)/10
        } else if thousand >= 1.0 {
            return round(thousand/100)
        } else {
            return Double(number)
        }
    }
}
