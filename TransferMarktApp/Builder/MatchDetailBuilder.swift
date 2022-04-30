//
//  MatchDetailBuilder.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 17.04.2022.
//

import Foundation
import UIKit

final class MatchDetailBuilder {
    static func make(with clubMatch: PlayClubMatch?) -> MatchDetailViewController {
        let storyboard = UIStoryboard(name: "MatchDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MatchDetailViewController") as! MatchDetailViewController
        
        let router = MatchDetailRouter(view: vc)
        let interactor = MatchDetailInteractor()
        let presenter = MatchDetailPresenter(router: router, interactor: interactor, view: vc,clubMatch: clubMatch)
        
        vc.presenter = presenter
        return vc
    }
}
