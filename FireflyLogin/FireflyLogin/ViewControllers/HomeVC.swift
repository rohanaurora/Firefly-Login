//
//  HomeVC.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/5/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var fireflyLabel: UILabel!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var currentUser = UserStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fireflyLabel.text = LoginText.title
        passwordTF.isSecureTextEntry = true
        passwordTF.addTarget(passwordTF, action: #selector(resignFirstResponder), for: .editingDidEndOnExit)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        currentUser.login(usernameTF.text ?? "", passwordTF.text ?? "", handler: {
            DispatchQueue.main.async { [weak self] in
                self?.processLogin()
            }
        })
    }
    
    private func processLogin() {
        if currentUser.isLoggedIn {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let dvc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            navigationController?.pushViewController(dvc, animated: true)
        } else {
            displayAlert()
        }
    }
    
    private func displayAlert() {
        showAlert(title: AlertText.title, message: AlertText.message, buttonTitle: AlertText.ok, handler: nil)
    }
}
