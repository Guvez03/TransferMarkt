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
}
