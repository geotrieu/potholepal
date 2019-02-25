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

protocol reportsDelegate: class {
    func didTaprefresh()
}
class ReportsViewController: UIViewController {
    weak var delegate: reportsDelegate?
    
    let pv = PotholeView()
    let pv2 = PotholeView()
    //let mosquitto = MosquittoServerController()
    
    let refreshIcon = UIImageView().then {
        $0.image = UIImage(named: "refreshIcon")
    }
    let recentReportsLabel = UILabel().then {
        $0.textColor = UI.Colors.purple
        $0.font = UI.Font.demiBold(30)
        $0.text = "Recent Reports"
    }
    
    let selectionButton = UIButton().then {
        $0.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        
    }
    
    @objc func handleButtonTap() {
        delegate?.didTaprefresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mosquitto.start()
        layoutViews()
    }
}

extension ReportsViewController {
    func layoutViews() {
        view.addSubview(recentReportsLabel)
        recentReportsLabel.easy.layout(Left(20), Top(25))
        
        view.addSubview(refreshIcon)
        refreshIcon.easy.layout(Right(25), Top(30), Width(30), Height(30))
        
        view.addSubview(selectionButton)
        selectionButton.easy.layout(Right(25), Top(30), Width(30), Height(30))
        
       


    }
}
