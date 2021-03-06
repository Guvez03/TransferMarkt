//
//  MatchDetailRouter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

final class MatchDetailRouter: MatchDetailsRouterProtocol {
    
    unowned var view: UIViewController
    
    init(view: UIViewController){
        self.view = view
    }
    
    func navigate(to route: MatchDetailsRouter) {
        switch route {
        case .detail(let player):
            let builder = PlayerInformationBuilder.make(with: player)
            view.show(builder, sender: nil)
        }

    }
    
    
    
}
