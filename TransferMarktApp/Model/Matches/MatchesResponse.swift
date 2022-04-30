//
//  ClubResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 26.03.2022.
//

import Foundation


struct Matches: Codable {
    let seasonID: String?
    let id: Int?
    let clubName: String?
    let share: Share?
    let playClubMatches: [PlayClubMatch]?
}

// MARK: - PlayClubMatch
struct PlayClubMatch: Codable {
    let id: ID?
    let competitionID: CompetitionID?
    let competitionName: CompetitionName?
    let competitionImage: String?
    let tournamentFlag: String?
    let round: String?
    let group, matchDay, matchDate, fullMatchDate: String?
    let matchTime: String?
    //let timestamp: Int?
    let homeClubID, homeClubName: String?
    let homeClubImage: String?
    let awayClubID, awayClubName: String?
    let awayClubImage: String?
    let result: String?
    let postponed: Bool?
    let resultObject: ResultObject?
    
}

enum ID: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ID.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ID"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Share
struct Share: Codable {
    let title: String?
    let url: String?
    let shareDescription: String?

    enum CodingKeys: String, CodingKey {
        case title, url
        case shareDescription = "description"
    }
}

// MARK: - ResultObject
struct ResultObject: Codable {
    let result, goalsHome, goalsAway: String?
    let minute: Minute?
    let state: String?
    let destinationValue: Int?
    //let destinationDescription: DestinationDescription?
    
    enum Minute: Codable {
        case integer(Int)
        case string(String)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Int.self) {
                self = .integer(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(Minute.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Minute"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .integer(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }
}

enum DestinationDescription: String, Codable {
    case spielbericht = "Spielbericht"
    case vorbericht = "Vorbericht"
}

enum CompetitionID: String, Codable {
    case cgb = "CGB"
    case cl = "CL"
    case fac = "FAC"
    case gb1 = "GB1"
    case klub = "KLUB"
    case usc = "USC"
}

enum CompetitionName: String, Codable {
    case eflCup = "EFL Cup"
    case faCup = "FA Cup"
    case fifaKlubWM = "FIFA Klub-WM"
    case premierLeague = "Premier League"
    case uefaChampionsLeague = "UEFA Champions League"
    case uefaSuperCup = "UEFA Super Cup"
}

