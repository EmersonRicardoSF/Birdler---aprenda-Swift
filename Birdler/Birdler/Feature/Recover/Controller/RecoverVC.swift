//
//  RecoverVC.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit
import FirebaseAuth // Adicione a importação do FirebaseAuth

class RecoverVC: UIViewController, UITextFieldDelegate {
    
    var recoverScreen: RecoverScreen?
    
    override func loadView() {
        recoverScreen = RecoverScreen()
        self.view = recoverScreen
        //        recoverScreen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverScreen?.delegate(delegate: self)
        recoverScreen?.emailTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemBackground.cgColor
        
        if let emailTextField = recoverScreen?.emailTextField, textField == emailTextField {
            textField.layer.borderColor = CGColor(red: 0.47, green: 0.05, blue: 0.98, alpha: 1)
        } else {
            print("Nenhuma informação")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func sendPasswordReset(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Erro ao enviar o email de redefinição de senha: \(error.localizedDescription)")
                    self.showAlert(title: "Erro", message: "Erro ao enviar o email de redefinição de senha: \(error.localizedDescription)")
                } else {
                    print("Email de redefinição de senha enviado com sucesso.")
                    self.showAlert(title: "Sucesso", message: "Email de redefinição de senha enviado com sucesso.")
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if title == "Sucesso" {
                let vc = LoginVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension RecoverVC: RecoverScreenProtocol {
    func customNavigation() {
    }
    
    func tappedEnviarButton() {
        guard let email = recoverScreen?.emailTextField.text, !email.isEmpty else {
            print("Email não pode estar vazio")
            // Adicione aqui o código para exibir uma mensagem de erro ao usuário, se necessário
            return
        }
        print("Enviado")
        sendPasswordReset(email: email)
    }
}
