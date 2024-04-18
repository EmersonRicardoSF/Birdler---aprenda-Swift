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
    func tappedRecuperarSenhaButton() {
        // MARK: ALTERAR ESSA NAV DEPOIS
        print("Recuperar Senha")
        let vc: ExerciseVC = ExerciseVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tappedLoginButton() {
        print("Entrar")
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedCriarCadastroButton(){
        print("Criar Cadastro")
    }
}
