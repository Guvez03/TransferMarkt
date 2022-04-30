//
//  AppDelegate.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 10.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        app.router.start()
        
        return true
    }
    
}

