//
//  ClubRouter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 31.03.2022.
//

import Foundation
import UIKit

final class ClubsRouter: ClubsRouterProtocol{
    func navigate(to route: ClubsRoute) {
        
    }
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
}
