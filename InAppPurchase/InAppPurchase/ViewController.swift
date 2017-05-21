//
//  ViewController.swift
//  InAppPurchase
//
//  Created by Aryzae on 2017/04/19.
//  Copyright © 2017年 ShoIto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpInsidePurchase(_ sender: UIButton) {
        label.text = ""
        InAppPurchaseManager.shared.printLabel = label
        InAppPurchaseManager.shared.validate(productIds: ["jp.shoito.InAppPurchaseTest.iap.item1", "jp.shoito.InAppPurchaseTest.iap.item2", "jp.shoito.InAppPurchaseTest.iap.item3"])
    }

    @IBAction func touchUpInsideRestore(_ sender: UIButton) {
    }

}

