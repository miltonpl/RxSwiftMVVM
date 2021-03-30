//
//  LoginViewModel.swift
//  RxSwiftPattern
//
//  Created by Milton Palaguachi on 3/30/21.
//

import Foundation
import RxSwift
//import RxCocoa

class LoginViewModel {
    
    let usernameTextPublishedSubject = PublishSubject<String>()
    let passwordTextPublishedSubject = PublishSubject<String>()
    
    /// username and password must be greater than 3 characters
    var isValid: Observable<Bool> {
        return Observable
            .combineLatest(self.usernameTextPublishedSubject
                            .asObserver()
                            .startWith(""),
                           self.passwordTextPublishedSubject
                            .asObserver()
                            .startWith(""))
            .map {$0.count > 3 && $1.count > 3}
            .startWith(false)
    }
    
}
