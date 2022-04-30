//
//  ClubsResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 1.04.2022.
//

import Foundation

// MARK: - Club
struct Clubs: Codable {
    let clubs: [Club]?
}

// MARK: - ClubElement
struct Club: Codable {
    let id, name: String?
    let image: String?
}
