//
//  LineUpsResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation

// MARK: - LineUPSResponse
struct LineUPSResponse: Codable {
    let formations: Formations?
    let coaches: Coaches?
}

// MARK: - Coaches
struct Coaches: Codable {
    let home: Home?
    let away: CoachesAway?
}

// MARK: - CoachesAway
struct CoachesAway: Codable {
    let countryID: Int?
    let countryImage: String?
    let secondCountryImage: String?
    let secondCountryName, id, personID, name: String?
    let image: String?
}


// MARK: - Home
struct Home: Codable {
    let countryID: Int?
    let countryImage: String?
    let secondCountryImage, secondCountryName, id: String?
    let personID, name: String?
    let image: String?
}

// MARK: - Formations
struct Formations: Codable {
    let list: Bool?
    let home, away: HomeClass?
}

// MARK: - HomeClass
struct HomeClass: Codable {
    let start: [String:Bank]?
    let bank:  [Bank]?
}

extension HomeClass {
    init(data: Data) throws {
        self = try JSONDecoder().decode(HomeClass.self, from: data)
    }
}

// MARK: - Bank
struct Bank: Codable {
    let number: String?
    let playerImage: String?
    let playerName, firstName, lastName, alias: String?
    let id: String?
    let position: Position?
    let posSort: Int?
    let formationPosition: Int?
    let preferredFoot, marketValue: String?
    let marketValueCurrency: String?
    let marketValueNumeral: String?
    let age: String?
    let countryID: Int?
    let countryImage: String?
    let secondCountryImage: String?
    let secondCountryName: String?
}



enum Position: String, Codable {
    case abwehr = "Abwehr"
    case mittelfeld = "Mittelfeld"
    case sturm = "Sturm"
    case torwart = "Torwart"
}
//
//// MARK: - Tactic
//struct Tactic: Codable {
//    let home, away: String?
//}



//struct JSONCodingKeys: CodingKey {
//    var stringValue: String
//
//    init?(stringValue: String) {
//        self.stringValue = stringValue
//    }
//
//    var intValue: Int?
//
//    init?(intValue: Int) {
//        self.init(stringValue: "\(intValue)")
//        self.intValue = intValue
//    }
//}


//extension KeyedDecodingContainer {
//
//    func decode(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any> {
//        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
//        return try container.decode(type)
//    }
//
//    func decodeIfPresent(_ type: Dictionary<String, Any>.Type, forKey key: K) throws -> Dictionary<String, Any>? {
//        guard contains(key) else {
//            return nil
//        }
//        guard try decodeNil(forKey: key) == false else {
//            return nil
//        }
//        return try decode(type, forKey: key)
//    }
//
//    func decode(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any> {
//        var container = try self.nestedUnkeyedContainer(forKey: key)
//        return try container.decode(type)
//    }
//
//    func decodeIfPresent(_ type: Array<Any>.Type, forKey key: K) throws -> Array<Any>? {
//        guard contains(key) else {
//            return nil
//        }
//        guard try decodeNil(forKey: key) == false else {
//            return nil
//        }
//        return try decode(type, forKey: key)
//    }
//
//    func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
//        var dictionary = Dictionary<String, Any>()
//
//        for key in allKeys {
//            if let boolValue = try? decode(Bool.self, forKey: key) {
//                dictionary[key.stringValue] = boolValue
//            } else if let stringValue = try? decode(String.self, forKey: key) {
//                dictionary[key.stringValue] = stringValue
//            } else if let intValue = try? decode(Int.self, forKey: key) {
//                dictionary[key.stringValue] = intValue
//            } else if let doubleValue = try? decode(Double.self, forKey: key) {
//                dictionary[key.stringValue] = doubleValue
//            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self, forKey: key) {
//                dictionary[key.stringValue] = nestedDictionary
//            } else if let nestedArray = try? decode(Array<Any>.self, forKey: key) {
//                dictionary[key.stringValue] = nestedArray
//            }
//        }
//        return dictionary
//    }
//}
//
//extension UnkeyedDecodingContainer {
//
//    mutating func decode(_ type: Array<Any>.Type) throws -> Array<Any> {
//        var array: [Any] = []
//        while isAtEnd == false {
//            // See if the current value in the JSON array is `null` first and prevent infite recursion with nested arrays.
//            if try decodeNil() {
//                continue
//            } else if let value = try? decode(Bool.self) {
//                array.append(value)
//            } else if let value = try? decode(Double.self) {
//                array.append(value)
//            } else if let value = try? decode(String.self) {
//                array.append(value)
//            } else if let nestedDictionary = try? decode(Dictionary<String, Any>.self) {
//                array.append(nestedDictionary)
//            } else if let nestedArray = try? decode(Array<Any>.self) {
//                array.append(nestedArray)
//            }
//        }
//        return array
//    }
//
//    mutating func decode(_ type: Dictionary<String, Any>.Type) throws -> Dictionary<String, Any> {
//
//        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
//        return try nestedContainer.decode(type)
//    }
//}
