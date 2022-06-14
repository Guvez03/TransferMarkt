//
//  PlayerInformationBuilder.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.06.2022.
//

import UIKit

class PlayerInformationBuilder {
    static func make(with player: Bank?) -> PlayerInformationViewController {
        let storyboard = UIStoryboard(name: "PlayerInformation", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayerInformationViewController") as! PlayerInformationViewController
        
        let router = PlayerInformationRouter(view: vc)
        let interactor = PlayerInformationInteractor()
        let presenter = PlayerInformationPresenter(view: vc, interactor: interactor, router: router, player: player)

        vc.presenter = presenter
        return vc
    }
}
