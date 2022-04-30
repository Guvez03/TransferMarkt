//
//  HomeRouter.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 29.03.2022.
//

import Foundation
import UIKit

final class HomeRouter {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension HomeRouter: HomeRouterProtocol {
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let clubMatches):
            let builder = MatchDetailBuilder.make(with: clubMatches)
            view.show(builder, sender: nil)
        }
    }
}
