//
//  ReportsFlowController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit


class ReportsFlowController: UIViewController {
    
    let reportsViewController = ReportsViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReportsFlowController {
    func start() {
        presentReportsController()
    }
    func presentReportsController() {
        add(childController: reportsViewController)
    }
}

