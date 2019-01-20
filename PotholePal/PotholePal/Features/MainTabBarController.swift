//
//  MainTabBarController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let csvc1 = ComingSoonViewController()
    let csvc2 = ComingSoonViewController()
    let csvc3 = ComingSoonViewController()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func start() {
        setupTabBarProperties()
        setupViewControllers()
    }
}

extension MainTabBarController {
    func setupTabBarProperties() {
        let attributes: [NSAttributedString.Key: Any] = [.font: UI.Font.demiBold(12)]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: UIControl.State.normal)
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UI.Colors.white
        tabBar.layer.borderWidth = 0.1
        tabBar.tintColor = UI.Colors.purple
    }
}

// MARK: - Setup TabBar View Controllers
extension MainTabBarController {
    func setupViewControllers() {
        let vc1 = createFirstViewController()
        let vc2 = createSecondViewController()
        let vc3 = createThirdViewController()
        
        
        self.viewControllers = [vc1, vc2, vc3]
        
        selectedIndex = 0
    }
    
    func createFirstViewController() -> UIViewController {
        var navigationVC = PotholePalNavigationController(rootViewController: csvc1)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "homeIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createSecondViewController() -> UIViewController {
        var navigationVC = PotholePalNavigationController(rootViewController: csvc2)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "reportIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createThirdViewController() -> UIViewController {
        var navigationVC = PotholePalNavigationController(rootViewController: csvc3)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "myAccountIcon", selectedImageName: "")
        return navigationVC
    }
    
    func setupTabBarItem(for navigationController: PotholePalNavigationController, title: String, imageName: String, selectedImageName: String) -> PotholePalNavigationController {
        let image = UIImage(named: imageName), selectedImage = UIImage(named: selectedImageName)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}


