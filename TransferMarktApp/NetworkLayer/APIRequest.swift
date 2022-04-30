//
//  APIRequest.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 11.03.2022.
//

import Foundation

// data modeller neden struct yapılır

struct APIRequest <T: Codable> {
    let action: ActionHelper
    let data: T?
}
