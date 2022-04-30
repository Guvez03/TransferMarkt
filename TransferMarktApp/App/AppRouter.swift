//
//  AppRouter.swift
//  MovieBox
//
//  Created by Ahmet Güvez on 5.03.2022.
//

import Foundation
import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
