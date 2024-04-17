//
//  RecoverVC.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit

class RecoverVC: UIViewController, HomeScreenProtocol {
    
    var recoverScreen: RecoverScreen?
    override func loadView() {
        recoverScreen = RecoverScreen()
        self.view = recoverScreen
//        recoverScreen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recoverScreen?.delegate(delegate: self)
    }
}

extension RecoverVC: RecoverScreenProtocol {
    func customNavigation() {
    }
    
    func tappedEnviarButton() {
        print("Enviado")
        let vc: LoginViewController = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
