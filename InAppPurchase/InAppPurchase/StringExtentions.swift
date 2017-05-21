//
//  StringExtentions.swift
//  InAppPurchase
//
//  Created by Aryzae on 2017/04/20.
//  Copyright © 2017年 ShoIto. All rights reserved.
//

import Foundation

extension String {
    // SHA256の文字列取得
    mutating func sha256String() -> String {
        let cryptoString = cString(using: .utf8)!
        let data = Data(bytes: cryptoString, count: characters.count)

        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))

        let dataBytes = data.withUnsafeBytes { UnsafeRawPointer($0) }
        CC_SHA256(dataBytes, CC_LONG(data.count), &digest)

        var output = String(describing: reserveCapacity(64))
        for index in 0..<32 {
            output = output.appendingFormat("%02x", digest[index])
        }
        return output
    }

}
