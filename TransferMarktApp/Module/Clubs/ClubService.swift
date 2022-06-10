//
//  ClubService.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation

final class ClubService {
    
    static func fetchClubs(request: ClubsRequest, completionHandler: @escaping (_ response: Clubs?, _ error: ErrorModel?) -> Swift.Void){
         
        // api request data boş göndermeyi dene
        let request = APIRequest(action: ActionHelper.clubs, data: request)

         NetworkManager.shared.service(request: request) { (response: Swift.Result<Clubs, ErrorModel>) in
             switch response {
             case .success(let response):
                 print(response)
                 completionHandler(response, nil)
             case .failure(let failure):
                 print(failure)
                 completionHandler(nil, failure)
             }
         }
     }
}
