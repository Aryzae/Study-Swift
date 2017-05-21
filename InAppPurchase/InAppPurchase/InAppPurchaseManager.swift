//
//  InAppPurchaseManager.swift
//  InAppPurchase
//
//  Created by Aryzae on 2017/04/19.
//  Copyright © 2017年 ShoIto. All rights reserved.
//

import UIKit
import StoreKit

class InAppPurchaseManager: NSObject {
    //
    var printLabel: UILabel = UILabel()
    class var shared: InAppPurchaseManager {
        return .sharedInstance
    }
    private static var sharedInstance = InAppPurchaseManager()

    var request: SKProductsRequest!
    dynamic var products: [SKProduct]!

    // Product情報をAppStoreから取得
    func validate(productIds: [String]) {
        request = SKProductsRequest(productIdentifiers: Set(productIds))
        // SKProductsRequestDelegate
        request.delegate = self
        request.start()
    }

    // 課金商品の一覧を取得
    func fetchProductsFrom(url: URL) {
        DispatchQueue.global(qos: .default).async {
            var jsonData = try? Data(contentsOf: url)

        }
    }

    // 支払い要求をAppStoreへ送信
    func buy(product: SKProduct) {
        let payment = SKMutablePayment(product: product)
        //payment.applicationUsername = UserManager.sharedInstance.currentUser.token.sha256String
    }

}

extension InAppPurchaseManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        let invalidProducts = response.invalidProductIdentifiers
        for invalidProduct in invalidProducts {
            printLabel.text = printLabel.text! + "invalid: \(invalidProduct)\n"
            print("invalid: \(invalidProduct)")
        }
        for product in products {
            printLabel.text = printLabel.text! + "valid: \(product)\n"
            print("valid: \(product)")
        }
    }

}

extension InAppPurchaseManager: SKPaymentTransactionObserver {
    // require
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .deferred:
                // parent lockで"Ask to buy"
                print(".deferrd")
            case .failed:
                // 購入失敗orキャンセル
                print(".failed")
            case .purchased:
                // 購入完了
                print(".purchased")
            case .purchasing:
                // 購入処理中
                print(".purchasing")
            case .restored:
                // リストア完了
                print(".restored")
            }
        }
    }

    // optional
    // Sent when transactions are removed from the queue (via finishTransaction:).
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {

    }

    // optional
    // Sent when an error is encountered while adding transactions from the user's purchase history back to the queue.
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {

    }

    // optional
    // Sent when all transactions from the user's purchase history have successfully been added back to the queue.
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {

    }

    // optional
    // Sent when the download state has changed.
    func paymentQueue(_ queue: SKPaymentQueue, updatedDownloads downloads: [SKDownload]) {

    }

}
