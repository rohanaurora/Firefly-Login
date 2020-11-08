//
//  String.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/6/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import UIKit

extension String {
    
    var hasLetterAndNumber : Bool {
      let regex = "([A-Za-z])([0-9])|([0-9])([A-Za-z])"
      return matches(regex)
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
