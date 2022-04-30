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
}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = UIColor.appColor(.selectedColor)
        self.tabBar.layer.shadowColor = UIColor.appColor(.selectedColor)?.cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.tabBar.layer.shadowRadius = 3
        self.tabBar.layer.shadowOpacity = 1
        self.tabBar.layer.masksToBounds = false
        TabBarController.tabbarItemApperance()

        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.appColor(.backgroundColor)

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        setupTabBar()
    }
    
    func setupTabBar(){
        
        let homeViewController =  createNavController(builder: Builder.homeBuilder, image: "star", selectedImage: "star.fill")
        let playersViewController =  createNavController(builder: Builder.clubsBuilder, image: "star", selectedImage: "star.fill")
        
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
        default:
            return  UINavigationController()
        }
    }
    
    func homeStart(image: String, selectedImage: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: HomeBuilder.make())
        viewController.tabBarItem.image = UIImage(named: "home-empty-icon")
        viewController.tabBarItem.title = "Home"
        viewController.tabBarItem.selectedImage = UIImage(named: "home-fill-icon")
        return viewController
    }
    func clubsStart(image: String, selectedImage: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: ClubsBuilder.make())
        viewController.tabBarItem.image = UIImage(named: "clubs-empty-icon")
        viewController.tabBarItem.title = NSLocalizedString("Clubs", comment: "")
        viewController.tabBarItem.selectedImage = UIImage(named: "clubs-fill-icon")
        return viewController
        
    }
}

extension TabBarController {

    static func tabbarItemApperance() {
        let selectedFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                                      NSAttributedString.Key.foregroundColor: UIColor.appColor(.selectedColor)]
        UITabBarItem.appearance().setTitleTextAttributes(selectedFontAttributes as [NSAttributedString.Key : Any], for: .selected)
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                              NSAttributedString.Key.foregroundColor: UIColor.appColor(.pinkColor)]

        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes as [NSAttributedString.Key : Any], for: .disabled)
    }
}
