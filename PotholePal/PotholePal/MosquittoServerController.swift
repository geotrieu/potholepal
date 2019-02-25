//
//  MosquittoServer.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//


import UIKit
import Foundation
import Moscapsule

protocol MosquittoDelegate: class {
    func didDetect()
}

class MosquittoServerController: UIViewController {
    var value: Int = 0
    var recentString: String = ""
    weak var delegate: MosquittoDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MosquittoServerController {
    func start(){
        let mqttConfig = MQTTConfig(clientId: "imyodaddy", host: "100.64.130.153", port: 1883, keepAlive: 600)
        mqttConfig.mqttAuthOpts = MQTTAuthOpts(username: "", password: "")
        mqttConfig.cleanSession = true
        mqttConfig.onMessageCallback = { mqttMessage in
            //NSLog("MQTT Message received: payload=\(mqttMessage.payloadString?.first)")
            print("\(mqttMessage.payloadString!)")
    
            if mqttMessage.payloadString!.first == "H" {
                self.adder()
                print("ok")
                 self.delegate?.didDetect()
            }
           
        }
        let mqttClient = MQTT.newConnection(mqttConfig)
        

        
        mqttClient.subscribe("potholes", qos: 2)
        
        //lol
        let deadline = DispatchTime.now() + 3000000.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            print("\(mqttClient.isConnected)")
            
        })
    }
    
    func hole1hole2() {
        if value == 0 {
            value += 1
        }
        else if value == 1 {
            value += 1
        }
        else {
            
        }
    }
    
    func adder() {
        value += 1
    }

}

