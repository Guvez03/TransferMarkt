//
//  ProfileInformation.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

struct PlayerInformation: Codable {
    let share: Share?
    let marketValueDevelopment: [MarketValueDevelopment]?
}

// MARK: - MarketValueDevelopment
struct MarketValueDevelopment: Codable {
    let date, unformattedDate, age, marketValue: String?
    let marketValueUnformatted: Int?
    let marketValueCurrency: MarketValueCurrency?
    let marketValueNumeral: String?
    let clubID: String?
    let clubName: String?
    let clubShortName: String?
    let clubImage: String?
    let seasonID: String?
}


enum MarketValueCurrency: String, Codable {
    case empty = "€"
}

enum MarketValueNumeral: String, Codable {
    case mio = "Mio."
    case tsd = "Tsd."
}

