//
//  User.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/6/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import Foundation

final class UserStore {
    private init() { }
    static let shared = UserStore()

    var username: String = ""
    var isLoggedIn: Bool = false
    
    
    func login(_ user: String, _ pass: String, handler: @escaping () -> Void) {
        if !user.isEmpty && !pass.isEmpty && user.hasLetterAndNumber && pass.hasLetterAndNumber  {
            username = user
            makeRequest(completion: {
                handler()
            })
        } else {
            isLoggedIn = false
            handler()
        }
    }
    
    private func makeRequest(completion: @escaping () -> Void) {
        let url = URL(string: Links.mockURL)!
        let networkClient = NetworkClient()
        
        networkClient.requestLogin(url: url) { result, errorMessage  in
            
            guard let res = result?.user else { return }
            print(res.debugDescription)
            
            if res.username == UserStore.shared.username {
                UserStore.shared.isLoggedIn = res.isSuccessful
            } else {
                UserStore.shared.isLoggedIn = false
            }
            
            if let e = errorMessage {
                print(e)
            }
            completion()
        }
    }
}
