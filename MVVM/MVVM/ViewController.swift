//
//  ViewController.swift
//  MVVM
//
//  Created by Aryzae on 2017/08/13.
//  Copyright © 2017年 Aryzae. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var usernameTextFiled: UITextField!
    @IBOutlet var passwordTextFiled: UITextField!
    @IBOutlet var confirmButton: UIButton!
    
    var viewModel = ViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        usernameTextFiled.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        passwordTextFiled.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposeBag)
        //
        viewModel.isValid.map { $0 }.bind(to: confirmButton.rx.isEnabled).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

