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
}

struct Count: Codable {
    let players, coaches, clubs, competitions: Int
    let referees: Int
}

struct Player: Codable {
    let id, playerName, firstName, lastName: String
    let alias: String
    let nationImage: String
    let club: String
    let playerImage: String
}
