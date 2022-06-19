//
//  ClubPresenter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation

final class ClubsPresenter: ClubsPresenterProtocol, ClubsInteractorDelegate {
    
    unowned let view: ClubsViewProtocol
    private var interactor: ClubsInteractorProtocol
    private let router: ClubsRouterProtocol
    
    init(view: ClubsViewProtocol, interactor: ClubsInteractorProtocol,router: ClubsRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load(selectedLig: String) {
        view.handleOutput(.laoding(true))
        view.handleOutput(.loadTitle("Clubs"))
        interactor.load(selectedLig: selectedLig)
    }
    
    func handleOutput(_ handleOutput: ClubsInteractorOutput) {
        
        switch handleOutput {
        case .showClubs(let clubs):
            view.handleOutput(.showClubs(clubs))
            view.handleOutput(.laoding(false))
        }
    }
}
