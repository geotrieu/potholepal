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

class MosquittoServerController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MosquittoServerController {
    func GO(){
        let mqttConfig = MQTTConfig(clientId: "imyodaddy", host: "100.64.130.73", port: 1883, keepAlive: 600)
        mqttConfig.mqttAuthOpts = MQTTAuthOpts(username: "", password: "")
        mqttConfig.cleanSession = true
        mqttConfig.onMessageCallback = { mqttMessage in
            //NSLog("MQTT Message received: payload=\(mqttMessage.payloadString?.first)")
            print("\(mqttMessage.payloadString!)")
        }
        
        let mqttClient = MQTT.newConnection(mqttConfig)
        
        //print("fuck salopan")
        //print("\(mqttClient.isConnected)")
        
        mqttClient.subscribe("potholes", qos: 2)
        
        //lol
        let deadline = DispatchTime.now() + 2.0
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            mqttClient.publish(string: "GO", topic: "potholes-a", qos: 0, retain: true)
            print("\(mqttClient.isConnected)")
            
        })
    }
}

