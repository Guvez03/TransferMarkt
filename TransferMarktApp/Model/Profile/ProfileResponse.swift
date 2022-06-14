//
//  ProfileResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

struct ProfileResponse: Codable {
    let share: Share?
    let playerProfile: PlayerProfile?
}

struct PlayerProfile: Codable {
    let playerID: String?
    let playerImage: String?
    let playerName, playerFullName, birthplace, dateOfBirth: String?
    let playerShirtNumber, birthplaceCountry: String?
    let birthplaceCountryImage: String?
    let age, height, foot, internationalTeam: String?
    let country: String?
    let countryImage: String?
    let countryShortName, secondCountry, secondCountryImage, league: String?
    let leagueLogo, clubImage: String?
    let club, clubID: String?
    let contractExpiryDate, agent, agentID, agentVerificationStatus: String?
    let outfitter, positionGroup, playerMainPosition, playerSecondPosition: String?
    let playerThirdPosition, marketValue, marketValueCurrency, marketValueNumeral: String?
    let marketValueLastChange: String?
}

