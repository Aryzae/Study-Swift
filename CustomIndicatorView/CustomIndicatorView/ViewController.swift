//
//  ViewController.swift
//  CustomIndicatorView
//
//  Created by Aryzae on 2015/07/04.
//  Copyright (c) 2015年 Aryzae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let indicator = CustomIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.indicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.indicator.center = self.view.center
        self.view.addSubview(self.indicator)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.indicator.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

