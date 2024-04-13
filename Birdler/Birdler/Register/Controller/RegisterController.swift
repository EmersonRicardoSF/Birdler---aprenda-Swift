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
        registerScreen = RegisterScreen()
        self.view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)

    }

}

extension RegisterController: RegisterScreenProtocol {
    func tappedCadastrarButton() {
        print("clicou no botao")
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
