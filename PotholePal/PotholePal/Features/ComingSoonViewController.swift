//
//  ComingSoonViewController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-19.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//


import UIKit
import Then
import EasyPeasy

class ComingSoonViewController: UIViewController {
    
    private let comingSoon = UIImageView(image: UIImage(named: "comingSoonBackground")!).then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = false
    }
    
    
    private let comingSoonLabel = UILabel().then {
        $0.text  = "This Page is Coming Soon"
        $0.font = UI.Font.demiBold(18)
        $0.textColor = UI.Colors.lightGrey
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
    }
}

// MARK: Layout Views
extension ComingSoonViewController {
    func layoutViews() {
        layoutBackgroundImageView()
        layoutComingSoonLabel()
    }
    
    func layoutBackgroundImageView() {
        view.addSubview(comingSoon)
        comingSoon.easy.layout(Top(-2), Bottom(110), Left(-1), Right(-1))
    }
    
    
    
    func layoutComingSoonLabel() {
        view.addSubview(comingSoonLabel)
        comingSoonLabel.easy.layout(Top(180), CenterX())
    }
}
