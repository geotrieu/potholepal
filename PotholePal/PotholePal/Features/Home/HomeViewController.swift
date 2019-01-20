//
//  HomeViewController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class HomeViewController: UIViewController {
    
    let mosquitto = MosquittoServerController()
    
    private let logoImage = UIImageView().then {
        $0.image = UIImage(named: "purpleLogo")
        $0.contentMode = .scaleAspectFill
    }
    
    private let ourMissionLabel = UILabel().then {
        $0.textColor = UI.Colors.grey
        $0.font = UI.Font.demiBold(22)
        $0.text = "Our Mission"
    }
    
    private let contentLabel = UILabel().then {
        $0.textColor = UI.Colors.lightGrey
        $0.font = UI.Font.demiBold(16)
        $0.text = "At PotholePal we strive for greatness by becoming an agile company which is able to develop in an agile manner agilely! The name of the game is agility and we live by that motto!"
        $0.numberOfLines = 0
    }
    
    private let contentView = UIView()
    private let mapImage = UIImageView().then {
        $0.image = UIImage(named: "map")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProperties()
        layoutViews()
    }
}

extension HomeViewController {
    func setupProperties() {
        contentView.layer.cornerRadius = 5.0
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func layoutViews() {
        view.addSubview(logoImage)
        logoImage.easy.layout(CenterX(), Top(30), Width(250))
        
        view.addSubview(ourMissionLabel)
        ourMissionLabel.easy.layout(CenterX(), Top(15).to(logoImage))
        
        view.addSubview(contentLabel)
        contentLabel.easy.layout(CenterX(), Left(20), Right(20), Top(15).to(ourMissionLabel))
        
        view.addSubview(contentView)
        contentView.easy.layout(Width(300), Height(400), CenterX(), Top(15).to(contentLabel))
        
        contentView.addSubview(mapImage)
        mapImage.easy.layout(Edges())
    }
    
}
