//
//  ViewController.swift
//  KeychainTest
//
//  Created by Aryzae on 2017/04/18.
//  Copyright © 2017年 ShoIto. All rights reserved.
//

import UIKit
import Security

class ViewController: UIViewController {

    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getPWD(_ sender: Any) {
        var query = Dictionary<String, Any>()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccount as String] = login.text
        query[kSecReturnData as String] = kCFBooleanTrue

        var passwordData: CFTypeRef?
        let error = SecItemCopyMatching(query as CFDictionary, &passwordData)
        if error == noErr {
            print("copy matching no error")
            password.text = String(data: passwordData as! Data, encoding: .utf8)
        } else if error == errSecItemNotFound {
            print("copy matching error NotFound")
        } else {
            print("copy matching error \(error)")
        }
    }

    let SERVICE_NAME = "TestApp"
    let IDENTIFIER = "jp.ne.sho.TestApp"

    @IBAction func update(_ sender: Any) {
        var attributes = Dictionary<String, Any>()
        var query = Dictionary<String, Any>()
        let passwordData = password.text?.data(using: .utf8)

        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccount as String] = login.text
        query[kSecAttrService as String] = SERVICE_NAME
        query[kSecAttrGeneric as String] = IDENTIFIER.data(using: .utf8)

        var error: OSStatus = SecItemCopyMatching(query as CFDictionary, nil)

        if error == noErr {
            print("copy matching no error")
            // update
            attributes[kSecValueData as String] = passwordData
            attributes[kSecAttrModificationDate as String] = Date()

            error = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            if error == noErr {
                print("update no error")
            } else {
                print("update error \(error)")
            }
        } else if error == errSecItemNotFound {
            // add
            attributes[kSecClass as String] = kSecClassGenericPassword
            attributes[kSecAttrAccount as String] = login.text
            attributes[kSecValueData as String] = passwordData

            error = SecItemAdd(attributes as CFDictionary, nil)
            if error == noErr {
                print("add no error")
            } else {
                print("add error \(error)")
            }
        } else {
            print("copy matching error \(error)")
        }
    }

    @IBAction func deleteKey(_ sender: Any) {
        var query = Dictionary<String, Any>()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccount as String] = login.text

        let error = SecItemDelete(query as CFDictionary)
        if error == noErr {
            print("delete no error")
        } else {
            print("delete error \(error)")
        }
    }

    @IBAction func dumpKey(_ sender: Any) {
        var query = Dictionary<String, Any>()

        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitAll

        var result: CFTypeRef?
        let error = SecItemCopyMatching(query as CFDictionary, &result)

        if error == noErr {
            print("copy matching no error")
            print(result as! CFArray)
        } else if error == errSecItemNotFound {
            print("copy matching item not found")
        } else {
            print("copy matching error \(error)")
        }
    }

}

