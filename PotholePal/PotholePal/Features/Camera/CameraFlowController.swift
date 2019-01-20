//
//  CameraFlowController.swift
//  PotholePal
//
//  Created by Kartik on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import Foundation
import UIKit



class CameraFlowController: UIViewController {
    
    let cameraController = CameraViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CameraFlowController {
    func start() {
        presentCameraController()
    }
}

extension CameraFlowController {
    func presentCameraController() {
        add(childController: cameraController)
    }
}
