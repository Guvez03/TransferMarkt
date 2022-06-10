//
//  File.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation

final class PlayerInformationService {
    
    static func fetchPlayerInformation(request: PlayerInformationRequest, completionHandler: @escaping (_ response: PlayerInformation?, _ error: ErrorModel?) -> Swift.Void){
         
        let request = APIRequest(action: ActionHelper.playerInfo, data: request)
         NetworkManager.shared.service(request: request) { (response: Swift.Result<PlayerInformation, ErrorModel>) in
             switch response {
             case .success(let response):
                 completionHandler(response, nil)
             case .failure(let failure):
                 completionHandler(nil, failure)
             }
         }
     }
    
    static func fetchProfile(request: ProfileRequest, completionHandler: @escaping (_ response: ProfileResponse?, _ error: ErrorModel?) -> Swift.Void){
         
        let request = APIRequest(action: ActionHelper.profile, data: request)
         NetworkManager.shared.service(request: request) { (response: Swift.Result<ProfileResponse, ErrorModel>) in
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
