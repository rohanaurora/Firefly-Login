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


/*
 
{
  "user": {
    "username": "test123",
    "isSuccessful": true
  }
}

*/
