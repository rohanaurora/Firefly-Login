//
//  User.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/6/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import Foundation

final class User {
    private init() { }
    static let shared = User()
    var username: String = ""
    
    var isLoggedIn : Bool = false
    
    func login(_ user: String, _ pass: String) {
        if !user.isEmpty && !pass.isEmpty && user.hasLetterAndNumber && pass.hasLetterAndNumber  {
                username = user
                isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}
