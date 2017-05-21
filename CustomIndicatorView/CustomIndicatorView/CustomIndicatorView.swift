//
//  CustomIndicatorView.swift
//  CustomIndicatorView
//
//  Created by Aryzae on 2015/07/04.
//  Copyright (c) 2015年 Aryzae. All rights reserved.
//

import Foundation
import UIKit

class CustomIndicatorView : UIImageView {
    
    let INDICATOR_ANIMATION_KEY = "indicator_animation_key"
    let ANIMATION_TIME = 1.2
    
    init() {
        super.init(image: nil)
        self.image = UIImage(named: "indicator.png")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func startAnimating() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = ANIMATION_TIME
        animation.fromValue = 0
        animation.toValue = NSNumber(value: (Double.pi / 180.0) * 360.0)
        animation.repeatCount = Float.infinity // HUGE_VALF
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: INDICATOR_ANIMATION_KEY)
    }
    
    override func stopAnimating() {
        self.layer.removeAnimation(forKey: INDICATOR_ANIMATION_KEY)
    }
    
}
