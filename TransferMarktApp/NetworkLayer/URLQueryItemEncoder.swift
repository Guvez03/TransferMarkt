//
//  URLQueryItemEncoder.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.12.2021.
//

import Foundation

enum URLQueryItemEncoder {
    static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
        let parametersData = try JSONEncoder().encode(encodable)
        let parameters = try JSONDecoder().decode([String: HTTPParameter].self,from:parametersData)
        return parameters.map{ URLQueryItem(name: $0, value: $1.description) }
    }
}
