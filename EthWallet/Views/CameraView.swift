//
//  CameraView.swift
//  EthWallet
//
//  Created by Louis Fan on 2022/5/27.
//

import SwiftUI
import UIKit
import AVFoundation

class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
}

class CameraPreview: UIView {
    
    var captureSession: AVCaptureSession?
    
    let previewView = PreviewView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized: // The user has previously granted access to the camera.
                self.setupCaptureSession()

            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.setupCaptureSession()
                    }
                }

            case .denied: // The user has previously denied access.
                return

            case .restricted: // The user can't grant access due to restrictions.
                return
        @unknown default:
            fatalError()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCaptureSession() {
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else {
            return
        }
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        guard videoDevice != nil, let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),captureSession.canAddInput(videoDeviceInput) else {
            return
        }
        captureSession.addInput(videoDeviceInput)
        
        let photoOutput = AVCapturePhotoOutput()
        guard captureSession.canAddOutput(photoOutput) else { return }
        captureSession.sessionPreset = .photo
        captureSession.addOutput(photoOutput)
        captureSession.commitConfiguration()
        
        previewView.frame = UIScreen.main.bounds
        previewView.videoPreviewLayer.session = captureSession
        previewView.videoPreviewLayer.videoGravity = .resizeAspectFill
        self.addSubview(previewView)
        
        captureSession.startRunning()
    }

}

struct CameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> CameraPreview {
        return CameraPreview()
    }
    
    func updateUIView(_ uiView: CameraPreview, context: Context) {
        
    }
    
    typealias UIViewType = CameraPreview
    
    
    
}


