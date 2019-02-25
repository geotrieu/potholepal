//
//  ReportsFlowController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import EasyPeasy


class ReportsFlowController: UIViewController {
    var counter: Int = 0
    let reportsViewController = ReportsViewController()
    let mosquitto = MosquittoServerController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        mosquitto.delegate = self
        reportsViewController.delegate = self
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
        mosquitto.start()
    }
}

extension ReportsFlowController: MosquittoDelegate {
    func didDetect() {
        print("okkk")
        remove(childController: reportsViewController)
        //mosquitto.value == 1 ? reportsViewController.hole1Hit() : reportsViewController.hole2Hit()
        add(childController: reportsViewController)
    }
}

extension ReportsFlowController: reportsDelegate {
    func didTaprefresh() {
        counter = counter + 1
        if counter == 1 {
            print("\(counter)")
            reportsViewController.view.addSubview(reportsViewController.pv)
            reportsViewController.pv.easy.layout(CenterX(), Top(20).to(reportsViewController.recentReportsLabel))
            
            
        }
        else if counter == 2 {
            print("\(counter)")

            reportsViewController.view.addSubview(reportsViewController.pv2)
            reportsViewController.pv2.easy.layout(CenterX(), Top(250).to(reportsViewController.pv))

        }
    }
}
