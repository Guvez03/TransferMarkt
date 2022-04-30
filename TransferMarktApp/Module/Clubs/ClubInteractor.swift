//
//  ClubInteractor.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation

final class ClubsInteractor: ClubsInteractorProtocol {
    var delegate: ClubsInteractorDelegate?
    
    func load(selectedLig: String) {
        
        let request = ClubsRequest(id: selectedLig)
        
        ClubService.fetchClubs(request: request) { response, error in
            if error == nil {
                guard let response = response else {return}
                self.delegate?.handleOutput(.showClubs(response))
            }
        }
        
    }
}
