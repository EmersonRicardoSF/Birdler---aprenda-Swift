// LoginViewController.swift
// Birdler
//
// Created by Nayla on 30/3/2024.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.usuarioTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginScreen?.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange() {
        let isEmailEmpty = loginScreen?.usuarioTextField.text?.isEmpty ?? true
        let isPasswordEmpty = loginScreen?.passwordTextField.text?.isEmpty ?? true
        loginScreen?.loginButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
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
        let email = loginScreen?.usuarioTextField.text ?? ""
        let senha = loginScreen?.passwordTextField.text ?? ""
        logarUsuario(email: email, senha: senha)
    }
    
    func tappedCriarCadastroButton(){
        print("Criar Cadastro")
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func logarUsuario(email: String, senha: String) {
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] success, error in
            if let error = error {
                print("Erro ao logar: \(error.localizedDescription)")
                // Aqui você pode mostrar um alerta ao usuário informando o erro
                let alert = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            } else {
                print("Sucesso! O usuário está logado")
                UserDefaults.standard.set(true, forKey: "UsuarioLogado")
                let vc: TabBarVC = TabBarVC()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
            }
        }
    }
}
