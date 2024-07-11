

//
//  RecoverVC.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit

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
        
        switch textField {
        case recoverScreen?.emailTextField:
            textField.layer.borderColor = CGColor(red: 0.47, green: 0.05, blue: 0.98, alpha: 1)
            
        default:
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
    
}

extension RecoverVC: RecoverScreenProtocol {
    func customNavigation() {
    }
    
    func tappedEnviarButton() {
        print("Enviado")
        let vc: HomeVC = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
