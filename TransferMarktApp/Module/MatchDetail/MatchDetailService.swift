//
//  MatchDetailService.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation

final class MatchDetailService {
    
    static func fetchLineUps(request: LineUpsRequest, completionHandler: @escaping (_ response: LineUPSResponse?, _ error: ErrorModel?) -> Swift.Void){
         
        let request = APIRequest(action: ActionHelper.lineUps, data: request)
         NetworkManager.shared.service(request: request) { (response: Swift.Result<LineUPSResponse, ErrorModel>) in
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
