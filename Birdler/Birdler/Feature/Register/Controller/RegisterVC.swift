//
//  RegisterVC.swift
//  Birdler
//
//  Created by Vitor Ernane Guedes on 14/05/24.
//


import UIKit
import Firebase
import FirebaseAuth

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
    
    
    func registrarUsuario() {
        Auth.auth().createUser(withEmail: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "") { sucesso, error in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                
                print("Usuário foi cadastrado..")
                
            }
        }
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedCadastrarButton() {
        print("clicou no botao")
        let vc: LoginVC = LoginVC()
        registrarUsuario()
        navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
