//
//  HomeService.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 13.03.2022.
//

import Foundation

struct HomeService {
    
   static func searchBy(request: SearchRequest, completionHandler: @escaping (_ response: SearchResponse?, _ error: ErrorModel?) -> Swift.Void){
        
        let request = APIRequest(action: ActionHelper.search, data: request)

        NetworkManager.shared.service(request: request) { (response: Swift.Result<SearchResponse, ErrorModel>) in
            switch response {
            case .success(let response):
                print(response.count.players)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    static func fetchNews(request: EmptyRequest, completionHandler: @escaping (_ response: News?, _ error: ErrorModel?) -> Swift.Void){
         
        // api request data boş göndermeyi dene
         let request = APIRequest(action: ActionHelper.news, data: request)

         NetworkManager.shared.service(request: request) { (response: Swift.Result<News, ErrorModel>) in
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
    
    static func fetchMatches(request: MatchesRequest, completionHandler: @escaping (_ response: Matches?, _ error: ErrorModel?) -> Swift.Void){
         
        // api request data boş göndermeyi dene
         let request = APIRequest(action: ActionHelper.matches, data: request)

         NetworkManager.shared.service(request: request) { (response: Swift.Result<Matches, ErrorModel>) in
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
