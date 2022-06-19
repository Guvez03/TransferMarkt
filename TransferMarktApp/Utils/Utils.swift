//
//  Utils.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 19.06.2022.
//

import Foundation

final class Utils {
    static func parseDictionary(clubsSelected: ClubSelected?,lineUps: LineUPSResponse?,indexPath: IndexPath) -> Bank?{
        var lineUpsValues: Dictionary<String, Bank>.Values?
        switch clubsSelected {
        case .away:
            lineUpsValues = Array(arrayLiteral: lineUps?.formations?.away?.start)[0]?.values
        case .home:
            lineUpsValues = Array(arrayLiteral: lineUps?.formations?.home?.start)[0]?.values
        case .none:
            lineUpsValues = Array(arrayLiteral: lineUps?.formations?.home?.start)[0]?.values
        }
        
        if let lineUpsValue = lineUpsValues {
            for (index, item) in lineUpsValue.enumerated() {
                if indexPath.row == index {
                    return item
                }
            }
        }
        return nil
    }
}
    
