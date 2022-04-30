//
//  Builder.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 12.03.2022.
//

import UIKit

final class HomeBuilder {
    static func make() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let router = HomeRouter(view: vc)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: vc, interactor: interactor, router: router)
        
        vc.presenter = presenter
        
        return vc
    }
}
