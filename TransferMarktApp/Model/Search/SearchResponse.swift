//
//  SearchResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 12.03.2022.
//

import Foundation

struct SearchResponse: Codable {
    let count: Count
    let players: [Player]
//    let clubs: [Club]
}

//// MARK: - Club
//struct Club: Codable {
//    let id, league, competitionID, competitionName: String
//    let name: String
//    let logoImage: String
//}

// MARK: - Count
struct Count: Codable {
    let players, coaches, clubs, competitions: Int
    let referees: Int
}

// MARK: - Player
struct Player: Codable {
    let id, playerName, firstName, lastName: String
    let alias: String
    let nationImage: String
    let club: String
    let playerImage: String
}
