//
//  ClubContracts.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation


enum ClubsInteractorOutput {
    case showClubs(Clubs)
}

protocol ClubsInteractorDelegate {
    func handleOutput(_ handleOutput: ClubsInteractorOutput)
}

protocol ClubsInteractorProtocol {
    var delegate: ClubsInteractorDelegate? {get set}
    func load(selectedLig: String)
}

protocol ClubsPresenterProtocol {
    func load(selectedLig: String)
}

enum ClubsPresenterOutput{
    case laoding(Bool)
    case loadTitle(String)
    case showClubs(Clubs)
}

protocol ClubsViewProtocol: AnyObject {
    func handleOutput(_ handleOutput: ClubsPresenterOutput)
}

enum ClubsRoute {
    case detail
}

protocol ClubsRouterProtocol {
func navigate(to route: ClubsRoute)
}
