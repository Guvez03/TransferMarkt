//
//  HomePresentation.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.03.2022.
//

import Foundation

final class NewsPresentation {

    let news: [NewsElement]

    init(news: [NewsElement]){
        self.news = news
    }
}

final class MatchesPresentation {

    let id: Int?
    let clubName: String?
    let playClubMatches: [PlayClubMatch]?
    
    init(id: Int?, clubName: String?, playClubMatches: [PlayClubMatch]?){
        self.id = id
        self.clubName = clubName
        self.playClubMatches = playClubMatches
    }
}


