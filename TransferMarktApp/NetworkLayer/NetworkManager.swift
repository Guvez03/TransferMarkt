//
//  NetworkManager.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.03.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
        
    private let baseEndpointUrl = URL(string: Constant.baseEndpointUrl)!
    private let session = URLSession(configuration: .default)
    
    func service<T: Decodable, U: Decodable>(request: APIRequest<T>, header: [String: String]? = nil, completion: @escaping (Swift.Result<U, ErrorModel>) -> Void) {
        
        guard let bodyDaTa = endpoint(for: request) else { return completion(.failure(ErrorModel.encodeError()))}

        var request = URLRequest(url: bodyDaTa)

        request.setValue(Header.host, forHTTPHeaderField:"x-rapidapi-host" )
        request.setValue(Header.key, forHTTPHeaderField: "x-rapidapi-key" )
        
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do{
                   // Response request json olarak yazzdır
                    //let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let response = try JSONDecoder().decode(U.self, from: data)
                    completion(.success(response))
                } catch{
                    completion(.failure(ErrorModel.init(message: "\(error)")))
                }
            }else if let error = error {
                completion(.failure(ErrorModel.init(message: "\(error)")))
            }
        }
        task.resume()
    }
    
    private func endpoint<T: Decodable>(for request: APIRequest<T>) -> URL? {
        
        guard let baseUrl = URL(string: request.action.path,relativeTo: baseEndpointUrl) else {
            fatalError("Bad resourceName: \(request.action)")
        }
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!

        let customQueryItems: [URLQueryItem]
        
        do{
            customQueryItems = try URLQueryItemEncoder.encode(request.data)
        }catch{
            fatalError("Wrong parameters: \(error)")
        }
        
        components.queryItems =  customQueryItems

                
        return components.url
                
    }
}
