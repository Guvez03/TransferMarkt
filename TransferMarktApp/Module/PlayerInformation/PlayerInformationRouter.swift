//
//  PlayerInformationRouter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import Foundation
import UIKit

final class PlayerInformationRouter: PlayerInformationRouterProtocol {
    
    unowned var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
        
    }
    
    func navigate(to route: PlayerInformationRoute) {
        
    }

    
}
