//
//  ViewController.swift
//  UITest
//
//  Created by Aryzae on 2017/05/21.
//  Copyright © 2017年 Aryzae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calcLabel: UILabel!
    @IBOutlet var lhsTextField: UITextField!
    @IBOutlet var rhsTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!

    let hoge = Hoge()
    let fuga = Fuga()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpInsideAddButton(_ sender: UIButton) {
        let lhsText = lhsTextField.text ?? ""
        let rhsText = rhsTextField.text ?? ""
        guard let lhsNumber = Int(lhsText) else {
            return
        }
        guard let rhsNumber = Int(rhsText) else {
            return
        }
        let calcNumber = hoge.add(a: lhsNumber, b: rhsNumber)

        calcLabel.text = String(calcNumber)
    }

    @IBAction func touchUpInsideMultiplyButton(_ sender: UIButton) {
        let lhsText = lhsTextField.text ?? ""
        let rhsText = rhsTextField.text ?? ""
        guard let lhsNumber = Int(lhsText) else {
            return
        }
        guard let rhsNumber = Int(rhsText) else {
            return
        }
        let calcNumber = fuga.multiply(a: lhsNumber, b: rhsNumber)

        calcLabel.text = String(calcNumber)
    }
}

