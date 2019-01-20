//
//  AppFlowController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//


import UIKit

class AppFlowController: UIViewController {
    private let splashViewController = SplashViewController()
    private var mainTabBarController: MainTabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        presentSplashViewController()
    }
}

// MARK: - SplashViewController Flow
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        
        let deadline = DispatchTime.now() + 3.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController)
        
        startMainFlowController()
    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func startMainFlowController() {
        mainTabBarController = MainTabBarController()
        add(childController: mainTabBarController)
        mainTabBarController.start()
    }
}

