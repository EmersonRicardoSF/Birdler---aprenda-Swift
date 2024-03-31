//
//  LoginViewController.swift
//  Birdler
//
//  Created by Nayla on 30/3/2024.
//

import UIKit

class LoginViewController: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)

    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        print("Chegou na ViewController")
        
    }
}
