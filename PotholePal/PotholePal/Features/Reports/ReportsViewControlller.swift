//
//  ReportsViewControlller.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class ReportsViewController: UIViewController {
    
    let pv = PotholeView()
    let pv2 = PotholeView()
    
    private let recentReportsLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(30)
        $0.text = "Recent Reports"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutViews()
        hole1Hit()
        hole2Hit()
    }
}

extension ReportsViewController {
    func layoutViews() {
        view.addSubview(recentReportsLabel)
        recentReportsLabel.easy.layout(Left(20), Top(25))
        
        
        
        
    }
    
    func hole1Hit() {
        view.addSubview(pv)
        pv.easy.layout(CenterX(), Top(20).to(recentReportsLabel))
    }
    
    func hole2Hit() {
        view.addSubview(pv2)
        pv2.easy.layout(CenterX(), Top(250).to(pv))
    }
}
