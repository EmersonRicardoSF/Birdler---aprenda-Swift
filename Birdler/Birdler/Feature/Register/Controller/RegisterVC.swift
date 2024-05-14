//
//  RegisterVC.swift
//  Birdler
//
//  Created by Vitor Ernane Guedes on 14/05/24.
//


import UIKit

class RegisterVC: UIViewController {

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

extension RegisterVC: RegisterScreenProtocol {
    func tappedCadastrarButton() {
        print("clicou no botao")
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
