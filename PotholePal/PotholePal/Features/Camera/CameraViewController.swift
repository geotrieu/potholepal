//
//  CameraViewController.swift
//  PotholePal
//
//  Created by Thayallan Srinathan on 2019-01-20.
//  Copyright © 2019 Thayallan Srinathan. All rights reserved.
//

import UIKit
import AVFoundation
import EasyPeasy
import Then

class CameraViewController: UIViewController {
    
    private var captureSession: AVCaptureSession?
    private var imageOutput: AVCapturePhotoOutput?
    private var preview: AVCaptureVideoPreviewLayer?
    private let previewView = UIView()
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        
        layoutViews()
        try? setupCamera()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CameraViewController {
    func setupCamera() throws {
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            fatalError("No video device found")
        }
        
        guard let input =  try? AVCaptureDeviceInput(device: captureDevice) else {
            fatalError("No Input Found")
        }
        
        self.captureSession = AVCaptureSession()
        guard let captureSession = self.captureSession else {throw ScannerErrors.unknown}
        captureSession.addInput(input)
        
        self.imageOutput = AVCapturePhotoOutput()
        guard let imageOutput = self.imageOutput else {throw ScannerErrors.unknown}
        captureSession.addOutput(imageOutput)
        
        self.preview = AVCaptureVideoPreviewLayer(session: captureSession)
        guard let preview = self.preview else {throw ScannerErrors.unknown}
        
        preview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        preview.frame = view.layer.bounds
        previewView.layer.addSublayer(preview)
        captureSession.startRunning()
        
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.flashMode = .on
        
         self.imageOutput?.capturePhoto(with: photoSettings, delegate: self)
    }
}

extension CameraViewController {
    func layoutViews() {
        view.addSubview(previewView)
        previewView.easy.layout(Edges())
    }
}




extension CameraViewController : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        let photoMetadata = photo.metadata
        print("Metadata orientation with key: ",photoMetadata[String(kCGImagePropertyOrientation)] as Any)
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error while generating image from photo capture data.")
            return
            
        }
        
        
    }
}

extension CameraViewController {
    enum ScannerErrors: Swift.Error {
        case unknown
    }
}


extension CameraViewController {
    func connect() {
        let connetcion = ConnectionController()
    }
}
