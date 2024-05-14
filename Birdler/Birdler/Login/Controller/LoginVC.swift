//
//  LoginViewController.swift
//  Birdler
//
//  Created by Nayla on 30/3/2024.
//

import UIKit

class LoginVC: UIViewController {

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

extension LoginVC: LoginScreenProtocol {
    func tappedRecuperarSenhaButton() {
        print("Recuperar Senha")
    }
    
    func tappedLoginButton() {
        print("Entrar")
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedCriarCadastroButton(){
        print("Criar Cadastro")
        let vc: RegisterController = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
