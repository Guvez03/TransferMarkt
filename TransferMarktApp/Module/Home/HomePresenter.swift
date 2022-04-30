//
//  HomePresenter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.03.2022.
//

import Foundation

final class HomePresenter: HomePresenterProtocol{
    
    unowned let view: HomeViewProtocol
    private let interactor: HomeInterectorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInterectorProtocol,router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }

    func load() {
        view.handleOutput(.loadViewTitle("Latest News", "Results"))
        view.handleOutput(.loadTitle("Home"))
        interactor.load()
    }
    
    func selectResult(index: Int) {
        interactor.showMatchDetail(index: index)
    }
    
}
 
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        // PRESENTATİON NASIL YAPILIR İNCELE
        case .showMatches(let matches):
            let presentation =  MatchesPresentation(id: matches.id, clubName: matches.clubName, playClubMatches: matches.playClubMatches)
            view.handleOutput(.showMatches(presentation))
        case .showNews(let news):
            let presentation = NewsPresentation(news: news.news)
            view.handleOutput(.showNews(presentation))
        case.showMatchesDetail(let clubMatch):
            router.navigate(to: .detail(clubMatches: clubMatch))
        }
    }
    
}
