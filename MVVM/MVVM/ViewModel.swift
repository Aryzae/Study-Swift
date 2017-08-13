//
//  ViewModel.swift
//  MVVM
//
//  Created by Aryzae on 2017/08/13.
//  Copyright © 2017年 Aryzae. All rights reserved.
//

import Foundation
import RxSwift

struct ViewModel {

    var username = Variable<String>("")
    var password = Variable<String>("")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(), self.password.asObservable()) { (username, password) in
            return username.characters.count > 0 && password.characters.count > 0
        }
    }
}
