//
//  NetworkClient.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/7/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import Foundation

class NetworkClient {
    
    func requestLogin(url: URL, completion: @escaping  (_ result: Result?, _ errorMessage: String?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                return
            }
            guard let data = data else {
                completion(nil, "No Data")
                return
            }
            switch statusCode {
                
            case 200:
                let userStore = try! JSONDecoder().decode(Result.self, from: data)
                completion(userStore, nil)
            case 404:
                completion(nil, "Bad Url")
            default:
                completion(nil, "statusCode: \(statusCode)")
            }
        }
        dataTask.resume()
    }
    
}
