//
//  APIRequest.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 11.03.2022.
//

import Foundation

struct APIRequest <T: Codable> {
    let action: ActionHelper
    let data: T?
}
