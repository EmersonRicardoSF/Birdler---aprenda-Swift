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
        let vc: RecoverVC = RecoverVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedLoginButton() {
        print("Entrar")
        let vc: TabBarVC = TabBarVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
//        MARK: quando fizer a ligacao com a Tabbar apagar essa metodo de cima e descomentar o de baixo.
//        let vc: NewsVC = NewsVC()
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tappedCriarCadastroButton(){
        print("Criar Cadastro")
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
