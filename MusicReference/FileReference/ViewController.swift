//
//  ViewController.swift
//  MusicReference
//
//  Created by Aryzae on 2018/05/03.
//  Copyright © 2018年 aryzae. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func openPanel(_ sender: NSButton) {
        let panel = NSOpenPanel()
        // defaultは、true
        panel.canChooseFiles = false
        // defaultは、false
        panel.allowsMultipleSelection = false
        // defaultは、false
        panel.canChooseDirectories = true
        //
        panel.begin { response in
            guard response == .OK else { return }
            // closure内でのみ選択したDirectoryのpathが取れる
            self.readItems(url: panel.url)
        }
    }
    
    func readItems(url: URL?) {
        guard let url = url else { return }
        guard let directoryPath = URL(string: url.path) else { return }
        // includingPropertiesForKeysの意味あるのか？
        let enumerator = FileManager.default.enumerator(at: directoryPath,
                                                        includingPropertiesForKeys: [.isDirectoryKey],
                                                        options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants]) { (url, error) -> Bool in
            // closuerは、errorハンドルのみ
            print(error)
            // trueならerrorでも継続、falseなら停止
            return true
        }
        
        var urls: [URL] = []
        for element in enumerator! {
            guard let url = element as? URL else { return }
            urls.append(url)
        }
        
        let viewController = NSStoryboard(name: NSStoryboard.Name(rawValue: "ReferenceTableViewController"), bundle: .main).instantiateInitialController() as! ReferenceTableViewController
        viewController.urls = urls
        presentViewControllerAsModalWindow(viewController)
    }
    
}

