//
//  MatchDetailContracts.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation

enum MatchDetailInteractorOutput {
    case loadResults
    case loadLineUps(LineUPSResponse?)
}

protocol MatchDetailInteractorProtocol {
    var delegate: MatchDetailInteractorDelegate? {get set}
    func loadLineUps(id: ID)
}
 
protocol MatchDetailInteractorDelegate {
    func handleOutput(_ output: MatchDetailInteractorOutput)
}

enum MatchDetailPresenterOutput {
    case loadTitle
    case loadResults(PlayClubMatch?)
    case loadLineUps(LineUPSResponse?)
}
 
protocol MatchDetailPresenterProtocol {
    func loadLineUps()
    func load()
}

protocol MatchDetailViewProtocol {
    func handleOutput(_ output: MatchDetailPresenterOutput)
}

enum MatchDetailsRouter {
    case detail
}

protocol MatchDetailsRouterProtocol {
func navigate(to route: MatchDetailsRouter)
}
