//
//  PlayerInformationPresenter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

final class PlayerInformationPresenter: PlayerInformationPresenterProtocol{
    
    private var interactor: PlayerInformationInteractorProtocol
    private var router: PlayerInformationRouterProtocol
    private var view: PlayerInformationViewProtocol
    private var player: Bank?
    
    init(view: PlayerInformationViewProtocol, interactor: PlayerInformationInteractorProtocol, router : PlayerInformationRouterProtocol, player: Bank?){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.player = player
    }
    
    func load() {
        interactor.delegate = self
        interactor.load(playerId: player?.id ?? "")
    }
    
}

extension PlayerInformationPresenter: PlayerInformationInteractorDelegate {
    func handleOutput(_ output: PlayerInformationInreactorOutput) {
        
        switch output {
        case .loadCharts(let playerMarketValue):
            view.handleOutput(.loadCharts(playerMarketValue: playerMarketValue))
        case .loadProfile(let profile):
            view.handleOutput(.loadProfile(profile: profile))
        case .loadTitle(let playerName):
            view.handleOutput(.loadTitle(playerName: playerName))

        }
    }
    
    
}
