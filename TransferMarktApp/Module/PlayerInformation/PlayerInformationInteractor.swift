//
//  PlayerInformationInteractor.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

final class PlayerInformationInteractor: PlayerInformationInteractorProtocol {
    var delegate: PlayerInformationInteractorDelegate?
    
    func load(playerId: String) {
        
        let playerReq = PlayerInformationRequest(id: playerId)
        let profileReq = ProfileRequest(id: playerId)

        PlayerInformationService.fetchPlayerInformation(request: playerReq) {  [weak self] response, error in
            if error == nil {
                guard let self = self, let response = response else {return}
                DispatchQueue.main.async {
                    self.delegate?.handleOutput(.loadCharts(playerMarketValue: response))
                }
            }
        }
        
        PlayerInformationService.fetchProfile(request: profileReq) {  [weak self] response, error in
            if error == nil {
                guard let self = self, let response = response else {return}
                DispatchQueue.main.async {
                    self.delegate?.handleOutput(.loadProfile(profile: response))
                    self.delegate?.handleOutput(.loadTitle(playerName: response.playerProfile?.playerName ?? ""))
                }
            }
        }
        
        
    }
    
    
}
