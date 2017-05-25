//
//  ViewController.swift
//  UserDefaultSynchronizeTest
//
//  Created by Aryzae on 2017/05/23.
//  Copyright © 2017年 Aryzae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userDefaults = UserDefaults.standard

    struct Key {
        let bool = "BoolKey"
        let int = "IntKey"
        let double = "DoubleKey"
        let string = "StringKey"
        let array = "ArrayKey"
    }
    let key = Key()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let stringTime = measure {
            self.saveString()
        }

        let arrayTime = measure {
            self.saveArray()
        }

//        for index in 0...1000 {
//            userDefaults.set(<#T##value: Int##Int#>, forKey: <#T##String#>)
//        }

//        saveBool()
//        saveInt()
//        saveDouble()
//        saveString()









//        userDefaults.set(true, forKey: key.bool)
//        userDefaults.set(1_234_567_890, forKey: key.int)
//        userDefaults.set(3.1415926535, forKey: key.double)
//        userDefaults.set("でも幸せならOKです👍", forKey: key.string)
//
//        print("bool(forKey:)")
//        print(userDefaults.bool(forKey: key.bool))
//        print(userDefaults.bool(forKey: key.int))
//        print(userDefaults.bool(forKey: key.double))
//        print(userDefaults.bool(forKey: key.string))
//        print()
//        print("int(forKey:)")
//        print(userDefaults.integer(forKey: key.bool))
//        print(userDefaults.integer(forKey: key.int))
//        print(userDefaults.integer(forKey: key.double))
//        print(userDefaults.integer(forKey: key.string))
//        print()
//        print("double(forKey:)")
//        print(userDefaults.double(forKey: key.bool))
//        print(userDefaults.double(forKey: key.int))
//        print(userDefaults.double(forKey: key.double))
//        print(userDefaults.double(forKey: key.string))
//        print()
//        print("string(forKey:)")
//        print(userDefaults.string(forKey: key.bool))
//        print(userDefaults.string(forKey: key.int))
//        print(userDefaults.string(forKey: key.double))
//        print(userDefaults.string(forKey: key.string))








    }

    func measure(_ process: @escaping () -> Void) -> TimeInterval {
        let start = Date.timeIntervalSinceReferenceDate
        process()
        let end = Date.timeIntervalSinceReferenceDate
        let time = end - start
        print("\(#function) time : \(time)")
        return time
    }

    func saveBool() {
        userDefaults.set(true, forKey: key.bool)

//        while true {
//            guard _ = userDefaults.bool(forKey: key.bool) else {
//                return
//            }
//        }
    }

    func saveInt() {
        userDefaults.set(1_234_567_890, forKey: key.int)
    }

    func saveDouble() {
        userDefaults.set(3.1415926535, forKey: key.double)
    }

    func saveString() {
        userDefaults.set("でも幸せならOKです👍", forKey: key.string)

//        while case .none = userDefaults.string(forKey: key.string) {}
//        print("non-loop")
    }

    func saveArray() {
        let array = ["アカレンジャイ", "アオレンジャイ", "ミドレンジャイ", "キミドレンジャイ", "フカミドレンジャイ"]
        userDefaults.set(array, forKey: "ArrayKey")

        while case .none = userDefaults.array(forKey: key.array) {}
    }

    func saveDictionary() {
//        userDefaults.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
    }

}

