//
//  MatchDetailContracts.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation

enum MatchDetailInteractorOutput {
    case loadResult
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
    case loading(Bool)
    case loadTitle
    case loadResult(PlayClubMatch?)
    case loadLineUps(LineUPSResponse?)
}
 
protocol MatchDetailPresenterProtocol {
    func loadLineUps()
    func loadResult()
    func playerDetail(player: Bank?)
}

protocol MatchDetailViewProtocol {
    func handleOutput(_ output: MatchDetailPresenterOutput)
}

enum MatchDetailsRouter {
    case detail(player: Bank?)
}

protocol MatchDetailsRouterProtocol {
func navigate(to route: MatchDetailsRouter)
}
