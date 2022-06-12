//
//  PlayerInformationConstractor.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

protocol PlayerInformationInteractorProtocol {
    var delegate: PlayerInformationInteractorDelegate? {get set}
    func load(playerId: String)
}

enum PlayerInformationInreactorOutput {
    case loadCharts(playerMarketValue: PlayerInformation?)
    case loadProfile(profile: ProfileResponse?)
    case loadTitle(playerName: String)
}

protocol PlayerInformationInteractorDelegate{
    func handleOutput(_ output: PlayerInformationInreactorOutput)
}

protocol PlayerInformationPresenterProtocol {
    func load()
}

enum PlayerInformationPresenterOutput {
    case loadCharts(playerMarketValue: PlayerInformation?)
    case loadProfile(profile: ProfileResponse?)
    case loadTitle(playerName: String)
}

protocol PlayerInformationViewProtocol{
    func handleOutput(_ output: PlayerInformationPresenterOutput)
}

enum PlayerInformationRoute {
    case detail
}

protocol PlayerInformationRouterProtocol {
func navigate(to route: PlayerInformationRoute)
}
