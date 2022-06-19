//
//  MatchDetailInteractor.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import UIKit

class MatchDetailInteractor: MatchDetailInteractorProtocol{
    var delegate: MatchDetailInteractorDelegate?
    
    func loadLineUps(id:ID) {

        let request = LineUpsRequest(id: id)
        
        MatchDetailService.fetchLineUps(request: request) { response, error in
            if error == nil {
                guard let response = response else {return}
                self.delegate?.handleOutput(.loadLineUps(response))
                self.delegate?.handleOutput(.loadResult)
            }
        }
    }
}
