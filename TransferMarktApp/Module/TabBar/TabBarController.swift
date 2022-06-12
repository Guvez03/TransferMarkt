//
//  TabBarController.swift
//  TransferMarktApp
//
//  Created by Ahmet Güvez on 30.03.2022.
//

import Foundation
import UIKit

enum Builder {
    case homeBuilder
    case clubsBuilder
    
    var title: String {
        switch self {
        case .homeBuilder:
            return "Home"
        case .clubsBuilder:
            return "Clubs"
        }
    }
}

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.appColor(.selectedOrange)
        if #available(iOS 15.0, *) {
            TabBarController.tabbarItemApperance()
        }else{
            self.tabBarController?.tabBar.barTintColor =  UIColor.appColor(.blue)
            self.tabBarController?.tabBar.unselectedItemTintColor = .lightText
            self.tabBarController?.tabBar.tintColor = .white
        }
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let homeViewController =  createNavController(builder: Builder.homeBuilder, image: "home-empty-icon", selectedImage: "home-fill-icon")
        let playersViewController =  createNavController(builder: Builder.clubsBuilder, image: "clubs-empty-icon" , selectedImage: "clubs-fill-icon")
        
        viewControllers = [homeViewController,playersViewController]
        
        guard let items = tabBar.items else {return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
}

extension UITabBarController {
    func createNavController(builder: Builder, image: String, selectedImage: String) -> UINavigationController{
        switch builder {
        case .homeBuilder:
            return  homeStart(image: image, selectedImage: selectedImage)
        case .clubsBuilder:
            return   clubsStart(image: image, selectedImage: selectedImage)

        }
    }
    
    private func homeStart(image: String, selectedImage: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: HomeBuilder.make())
        viewController.tabBarItem.image = UIImage(named: image)?.withTintColor(.white)
        viewController.tabBarItem.title = Builder.homeBuilder.title
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withTintColor(.orange)
        return viewController
    }
    private func clubsStart(image: String, selectedImage: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: ClubsBuilder.make())
        viewController.tabBarItem.image = UIImage(named: image)?.withTintColor(.white)
        viewController.tabBarItem.title = Builder.clubsBuilder.title
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withTintColor(.orange)
        return viewController
        
    }
}

extension TabBarController {

    static func tabbarItemApperance() {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor =  UIColor.appColor(.blue)
            
            appearance.compactInlineLayoutAppearance.normal.iconColor = .lightText
            appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
            
            appearance.inlineLayoutAppearance.normal.iconColor = .lightText
            appearance.inlineLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
            
            appearance.stackedLayoutAppearance.normal.iconColor = .lightText
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
