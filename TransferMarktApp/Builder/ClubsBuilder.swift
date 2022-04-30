//
//  ClubsBuilder.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 30.03.2022.
//

import Foundation
import UIKit

final class ClubsBuilder {
    static func make() -> ClubsViewController {
        let storyboard = UIStoryboard(name: "Clubs", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ClubsViewController") as! ClubsViewController
        
        let router = ClubsRouter(view: vc)
        let interactor = ClubsInteractor()
        let presenter = ClubsPresenter(view: vc, interactor: interactor, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
}
