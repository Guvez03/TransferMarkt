//
//  LigName.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 16.04.2022.
//

import Foundation

enum LigName: String,CaseIterable{
    case TR1
    case IT1
    case GB1
    case L1
    case ES1
    case FR1

    var ligName: String {
        switch self {
        case .TR1:
            return "Süper Lig"
        case .IT1:
            return "Serie A"
        case .GB1:
            return "Premier Lig"
        case .L1:
            return "Bendesliga"
        case .ES1:
            return "La Liga"
        case .FR1:
            return "Ligue 1"
        }
    }
}
