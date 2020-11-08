//
//  UIViewController.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/6/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import UIKit

extension UIViewController {
    
    struct Alert {
        static var alert: UIAlertController = UIAlertController()
    }
    
    func showAlert(title: String? = "", message:String? = "", buttonTitle: String = AlertText.ok, handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        Alert.alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
        Alert.alert.addAction(action)
        present(Alert.alert, animated: true, completion: nil)
    }
    
    func hideAlert() {
        Alert.alert.dismiss(animated: true, completion: nil)
    }
}
