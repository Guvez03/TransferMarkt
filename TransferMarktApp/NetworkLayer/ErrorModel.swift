//
//  ErrorModel.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 11.03.2022.
//

import Foundation

struct ErrorModel: Error, Codable {
    var message: String?
    
    init(message: String){
        self.message = message
    }
}
extension ErrorModel {
    
    static func encodeError() -> ErrorModel {
        return ErrorModel( message: " Encoding Error")
    }
    
    static func decodeError() -> ErrorModel {
        return ErrorModel(message: " Parse Error")
    }
}
