//
//  NewsResponse.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 24.03.2022.
//

import Foundation


struct News: Codable {
    let news: [NewsElement]
}

struct NewsElement: Codable {
    let id, newsHeadline: String?
    let timestamp: Int?
    let newsSecondImage: String?
    let newsDate: String?
    let fullNewsDate: String?
    let newsTime, newsSource, newsStartPageFlag, newsShortMessageFlag: String?
    let newsTeaser: String?
    let newsFirstImage: String?
    let newsSpotlightFirstImage: String?
    let newsSpotlightSecondImage, newsCategoryID: String?
    let newsCategoryTag: String?
    let newsTickerFlag, newsUpdateFlag: String?
    let spotlightPriority: SpotlightPriority?
    
    enum SpotlightPriority: Codable {
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
            throw DecodingError.typeMismatch(SpotlightPriority.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SpotlightPriority"))
        }
    }
}
