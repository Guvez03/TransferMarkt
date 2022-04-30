//
//  HomeContracts.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.03.2022.
//

import Foundation

// Interactor

protocol HomeInterectorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? {get set}
    func load()
    func showMatchDetail(index: Int)
}

enum HomeInteractorOutput{
    case showMatches(Matches)
    case showNews(News)
    case showMatchesDetail(PlayClubMatch?)
}

protocol HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput)
}
// Presenter

protocol HomePresenterProtocol: AnyObject{
    func load()
    func selectResult(index: Int)
}

enum HomePresenterOutput {
    case loadTitle(String)
    case loadViewTitle(String,String)
    case showMatches(MatchesPresentation)
    case showNews(NewsPresentation)
}
//view

protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}

//Router

enum HomeRoute {
    case detail(clubMatches: PlayClubMatch?)
}

protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}
 

