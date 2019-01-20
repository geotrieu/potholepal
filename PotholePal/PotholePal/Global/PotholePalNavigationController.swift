//
//  PotholePalNavigationController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//


import UIKit

class PotholePalNavigationController: UINavigationController {
    
    // ENUMERATION - ScutoNavigationController Color Schemes
    enum PotholePalNavigationControllerColorScheme {
        case white, black
    }
    
    var colorScheme: PotholePalNavigationControllerColorScheme = .white {
        didSet {
            setColorScheme()
        }
    }
    
    init(rootViewController: UIViewController, colorScheme: PotholePalNavigationControllerColorScheme = .white) {
        super.init(rootViewController: rootViewController)
        
        self.colorScheme = colorScheme
        
        setupNavigationControllerProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Override Variables and Functions
extension PotholePalNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch colorScheme {
        case .white:
            return .default
        case .black:
            return .lightContent
            
        }
    }
}

// EXTENSION - ScutoNavigationController View Customization
extension PotholePalNavigationController {
    
    func setupNavigationControllerProperties() {
        isNavigationBarHidden = true
        setColorScheme()
    }
    
    func setColorScheme() {
        view.backgroundColor = UIColor.white
    }
}
