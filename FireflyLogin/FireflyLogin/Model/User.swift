//
//  Profile.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/7/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import Foundation

struct User: Codable {
    
    enum CodingKeys: String, CodingKey {
            case username = "username"
            case isSuccessful = "isSuccessful"
    }
    
    var username: String!
    var isSuccessful: Bool!
}

struct Result: Codable {
    
    enum CodingKeys: String, CodingKey {
            case user = "user"
    }
    
    var user: User!
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        var description: String = ""
        description.append("----- Network Response -----")
        description.append(String(format:"\n username: %@", username as String))
        description.append(String(format:"\n isSuccessful: %@\n", isSuccessful?.description ?? "none"))
        return description
    }
}

// JSON response
//https://gist.githubusercontent.com/rohanaurora/f51ff84e485fc0af04bd6ed530dcf22f/raw/c1dde6477524e20c99748268d05a73a98d1803cf/user.json

/*
{
  "user": {
    "username": "test123",
    "isSuccessful": true
  }
}

*/
