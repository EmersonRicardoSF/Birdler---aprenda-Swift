//
//  RegisterController.swift
//  Birdler
//
//  Created by Vitor Ernane Guedes on 09/04/24.
//

import UIKit

class RegisterController: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
