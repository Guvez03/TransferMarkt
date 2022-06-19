//
//  HomeInteractor.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.03.2022.
//

import Foundation

final class HomeInteractor: HomeInterectorProtocol {
    var delegate: HomeInteractorDelegate?
    let group = DispatchGroup()
    private var matches: Matches?
    func load() {
        
        let machesReq = MatchesRequest(id: "631")
        let newsReq = EmptyRequest()

        group.enter()
        HomeService.fetchNews(request: newsReq) { [weak self] response, error in
            guard let self = self , let response = response else { return }
            self.delegate?.handleOutput(.showNews(response))
            self.group.leave()
        }
        
        group.enter()
        HomeService.fetchMatches(request: machesReq) { [weak self] response, error in
            guard let self = self , let response = response else { return }
            self.delegate?.handleOutput(.showMatches(response))
            self.matches = response
            self.group.leave()
        }
        
        group.notify(queue: .main)  { [weak self]  in
            self?.delegate?.handleOutput(.loading(false))
        }
    }

    func showMatchDetail(index: Int) {
        delegate?.handleOutput(.showMatchesDetail(matches?.playClubMatches?[index]))
    }
}
