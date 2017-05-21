//
//  InAppPurchaseHelper.swift
//  InAppPurchase
//
//  Created by Aryzae on 2017/04/20.
//  Copyright © 2017年 ShoIto. All rights reserved.
//

import UIKit
import StoreKit

class InAppPurchaseHelper: NSObject {
    // 課金可能かチェック
    class func canMakePayments() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }

    // ロケールに合わせた価格表示
    class func formattedPriceOf(product: SKProduct) -> String {
        let formatter = NumberFormatter()
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        formatter.locale = product.priceLocale
        return formatter.string(from: product.price)!
    }

}
