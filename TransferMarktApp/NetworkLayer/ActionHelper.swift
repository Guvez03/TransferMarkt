//
//  ActionHelper.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 12.03.2022.
//

import Foundation

public struct Constant {
    public static let baseEndpointUrl = "https://transfermarket.p.rapidapi.com/"
    public static let publicKey = "1867814b24891026407ac6af93805d3e"
    public static let privateKey = "4aea5dbd38011de651c1550fbe64ae9e66db4f83"
}

public struct Header {
    public static let host = "transfermarket.p.rapidapi.com"
    public static let key = "e9dea7d647msh79e7418855ed120p15d416jsn4afd29cc074d"
}

enum ActionHelper {
    case search
    case news
    case matches
    case clubs
    case lineUps
    case playerInfo
    case profile
}

extension ActionHelper {
    var path: String {
        switch self {
        case .search:
            return "search"
        case .news:
            return "news/list-latest"
        case .matches:
            return "matches/list-by-club"
        case .clubs:
            return "clubs/list-by-competition"
        case .lineUps:
            return "matches/get-line-ups"
        case .playerInfo:
            return "players/get-market-value"
        case .profile:
            return "players/get-profile"

        }
    }
}
