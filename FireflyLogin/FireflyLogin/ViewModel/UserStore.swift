//
//  User.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/6/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import UIKit

final class UserStore {
    private init() { }
    static let shared = UserStore()
    
    var username: String = ""
    var isLoggedIn: Bool = false
    
    internal func login(_ user: String, _ pass: String, handler: @escaping () -> Void) {
        validate(for: user, pass: pass)
        let dm = DataManager()
        dm.generateMock()
        dm.makeMockRequest(completion: {
            handler()
        })
    }
    
    private func validate(for user: String, pass: String) {
        username = user
        if !user.isEmpty && !pass.isEmpty && user.hasLetterAndNumber && pass.hasLetterAndNumber  {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}
