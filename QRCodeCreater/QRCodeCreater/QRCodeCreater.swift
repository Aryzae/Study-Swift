//
//  QRCodeCreater.swift
//  QRCodeCreater
//
//  Created by ShoIto on 2016/05/07.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import UIKit
import CoreImage

let QRCodeGenerator = "CIQRCodeGenerator"
let InputMessage = "inputMessage"
let InputCorrectionLevel = "inputCorrectionLevel"
let CorrectionLevelDefault = "M"
let QRCodeScaleDefault: CGFloat = 1.0

protocol QRCodeCreater {
    func createQRCode(_ text: String?, correctionLevel: String?, scale: CGFloat?) -> UIImage?
}

extension QRCodeCreater {
    func createQRCode(_ text: String?, correctionLevel: String?, scale: CGFloat?) -> UIImage? {
        // Default値設定(出来れば!を使わないように書くべきか)
        guard let text = text else { return nil }
        guard let correctionLevel = correctionLevel else { return nil }
        guard let scale = scale else { return nil }
        
        // textをUTF8にEncode
        guard let encodeText = text.data(using: String.Encoding.utf8) else {
            return nil
        }
        let qrCodeParameters: Dictionary<String, AnyObject> = [InputMessage: encodeText as AnyObject, InputCorrectionLevel: correctionLevel as AnyObject]
        // parameter設定してQR作成
        guard let qrCode = CIFilter(name: QRCodeGenerator, withInputParameters: qrCodeParameters) else {
            return nil
        }
        
        // resize
        let sizeTransform = CGAffineTransform(scaleX: scale, y: scale)
        // create
        guard let outputImage = qrCode.outputImage else {
            return nil
        }
        let image = outputImage.applying(sizeTransform)
        
        return UIImage(ciImage: image, scale: 1, orientation: .up)
    }
}
