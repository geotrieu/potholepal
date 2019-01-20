//
//  SplashViewController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class SplashViewController: UIViewController {
    
    private let potholePalLogo = UIImageView().then {
        $0.image = UIImage(named: "whiteLogo")
        $0.contentMode = .scaleAspectFit
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.purple
        
        layoutViews()
    }
    
    func layoutViews() {
        view.addSubview(potholePalLogo)
        potholePalLogo.easy.layout(CenterX(), Top(300), Width(240))
    }
}
