//
//  PotholeView.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class PotholeView: UIView {
    
    private let contentView = UIView()
    private let contentViewB = UIView()
    
    private let detectedLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(24)
        $0.text = "Pothole Detected"
    }
    
    private let detailsLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(20)
        $0.text = "Details: "
    }
    
    private let latitudeLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(18)
        $0.text = "Latitude: 87738722"
    }
    
    private let longitudeLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(18)
        $0.text = "Longitude: 88777882"
    }
    
    private let purpleView = UIView()
    private let sendAsphaltTeamLabel = UILabel().then {
        $0.textColor = UI.Colors.white
        $0.font = UI.Font.demiBold(22)
        $0.text = "Send Asphalt Squadron"
    }
    
    init() {
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProperties() {
        contentViewB.clipsToBounds = true
        purpleView.clipsToBounds = true
        contentView.layer.backgroundColor = UI.Colors.white.cgColor
        contentView.layer.cornerRadius = 35
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        purpleView.backgroundColor = UI.Colors.purple
    }
    
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Width(300), Height(200), CenterX())
        
        addSubview(contentViewB)
        contentViewB.easy.layout(Width(300), Height(200), CenterX())
        
        contentView.addSubview(detectedLabel)
        detectedLabel.easy.layout(Left(20), Top(10))
        
        contentView.addSubview(detailsLabel)
        detailsLabel.easy.layout(Left(20), Top(5).to(detectedLabel))
        
        contentView.addSubview(latitudeLabel)
        latitudeLabel.easy.layout(Left(20), Top(5).to(detailsLabel))
        
        contentView.addSubview(longitudeLabel)
        longitudeLabel.easy.layout(Left(20), Top(5).to(latitudeLabel))
        
        contentViewB.addSubview(purpleView)
        purpleView.easy.layout(Bottom(), Width(300), Height(50), CenterX())
        
        purpleView.addSubview(sendAsphaltTeamLabel)
        sendAsphaltTeamLabel.easy.layout(CenterX(), CenterY())
    }
}
