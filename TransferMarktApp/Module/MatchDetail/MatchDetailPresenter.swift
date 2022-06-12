//
//  MatchDetailPresenter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation

class MatchDetailPresenter: MatchDetailPresenterProtocol {
    
    private var router: MatchDetailsRouterProtocol
    private var interactor: MatchDetailInteractorProtocol
    private var view: MatchDetailViewProtocol
    
    var clubMatch: PlayClubMatch?
    
    init(router:MatchDetailsRouterProtocol,interactor: MatchDetailInteractorProtocol,view: MatchDetailViewProtocol,clubMatch: PlayClubMatch?){
        self.router = router
        self.view = view
        self.interactor = interactor
        self.interactor.delegate = self
        self.clubMatch = clubMatch
    }
    
    func loadResult(){
        view.handleOutput(.loadResult(clubMatch))
    }
    
    func loadLineUps() {
        guard let id = clubMatch?.id else {return}
        interactor.loadLineUps(id: id)
    }
    
    func playerDetail(player: Bank?) {
        router.navigate(to: .detail(player: player))
    }
}

extension MatchDetailPresenter: MatchDetailInteractorDelegate {
    func handleOutput(_ output: MatchDetailInteractorOutput) {
        switch output {
        case .loadResult:
            break
        case .loadLineUps(let lineUps):
            view.handleOutput(.loadLineUps(lineUps))
        }
    }
}
