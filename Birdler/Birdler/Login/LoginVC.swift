//
//  LoginVC.swift
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
        loginScreen?.configTextFieldDelegate(delegate: self)

    }
}

extension LoginVC: LoginScreenProtocol {
    func tappedRecuperarSenhaButton() {
        print("Recuperar Senha")
    }
    
    func tappedLoginButton() {
        print("Entrar")
//        let vc: tabBar = TabBar()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc,animated: true)
        
        
    }
    
    func tappedCriarCadastroButton(){
        print("Criar Cadastro")
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        let usuarioTextField: String = loginScreen?.usuarioTextField.text ?? ""
        let passwordTextField: String = loginScreen?.passwordTextField.text ?? ""
        
        if !usuarioTextField.isEmpty && !passwordTextField.isEmpty {
            print("Botao habilitado")
            loginScreen?.loginButton.isEnabled = true
            DispatchQueue.main.async {
                let gradient = self.loginScreen?.getGradientLayer(bounds: self.loginScreen?.loginButton.bounds ?? CGRect())
                self.loginScreen?.loginButton.backgroundColor = self.loginScreen?.gradientColor(bounds: self.loginScreen?.loginButton.bounds ?? CGRect(), gradientLayer: gradient!)
                
            }

        } else {
            print("Botao desabilitado")
            loginScreen?.loginButton.isEnabled = false
        
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return false
        
    }
}
