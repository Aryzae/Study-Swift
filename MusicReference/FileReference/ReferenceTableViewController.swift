//
//  ReferenceTableViewController.swift
//  MusicReference
//
//  Created by Aryzae on 2018/05/04.
//  Copyright © 2018年 aryzae. All rights reserved.
//

import Cocoa

enum TableViewHeaderTitle: String {
    case name = "ファイル名"
    case path = "パス"
    case extesion = "拡張子"
    case size = "ファイルサイズ"
}

class ReferenceTableViewController: NSViewController {

    var urls: [URL]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension ReferenceTableViewController: NSTableViewDelegate {
    
}

extension ReferenceTableViewController: NSTableViewDataSource {
    //
    func numberOfRows(in tableView: NSTableView) -> Int {
        return urls.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let url = urls[row]
        // forKeysで指定していないものは、nilになる
        let resourceValue = try! url.resourceValues(forKeys: [.nameKey, .totalFileSizeKey, .pathKey])

        switch TableViewHeaderTitle.init(rawValue: tableColumn!.title)! {
        case .name:
            return resourceValue.name
        case .path:
            return resourceValue.path
        case .extesion:
            return url.pathExtension
        case .size:
            return resourceValue.totalFileSize
        }
    }
}


