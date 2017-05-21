//
//  QRCodeReader.swift
//  QRCodeReader
//
//  Created by ShoIto on 2016/04/29.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import UIKit
import AVFoundation

protocol CodeProtocol {
    func foundCode(_ code: String)
}

class QRCodeReader: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // MARK: -
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var delegate: AnyObject?
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput
        let metadataOutput = AVCaptureMetadataOutput()
        
        // tryでやらないとAVCaptureDeveceInputにErrorが出る
        do {
            try videoInput = AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            // error handling
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            launchFailed();
            return;
        }
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            // 認識させる物
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        } else {
            launchFailed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        // 開始
        captureSession.startRunning();
    }
    
    // 起動失敗時(主にSimulater時)
    func launchFailed() {
        let alert = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code. Please use a device with a camera.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        captureSession = nil
    }
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        // 停止
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject
            
            // 読み取ったことを振動で知らせる
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            guard let delegateVC: ViewController = (delegate as! ViewController) else {
                return
            }
            delegateVC.foundCode(readableObject.stringValue);
        }
        
        dismiss(animated: true, completion: nil)
    }
}
