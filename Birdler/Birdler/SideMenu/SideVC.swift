//
//  SideVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//
//

import UIKit
import FirebaseAuth

class SideVC: UIViewController {
    
    var sideScreen: SideScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        sideScreen?.delegate(delegate: self)
       
    }
    
    override func loadView() {
        sideScreen = SideScreen()
        view = sideScreen
    }
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "authToken")
            UserDefaults.standard.set(false, forKey: "UsuarioLogado")
            
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    private func navigateToLogin() {
        let vc = LoginVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate,
           let window = delegate.window {
            window.rootViewController = nav
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

extension SideVC: SideScreenProtocol {
    func editProfileNavigation() {
        let vc: EditProfileVC = EditProfileVC()
        
       navigationController?.pushViewController(vc, animated: true)
        //present(vc, animated: true)
    }
    
    func logoutNavigation() {
        let alert = UIAlertController(title: "Confirmar", message: "Você deseja sair?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: { [weak self] _ in
            self?.logout { [weak self] result in
                switch result {
                case .success:
                    self?.navigateToLogin()
                case .failure(let error):
                    self?.showAlert(title: "Erro", message: error.localizedDescription)
                }
            }
        }))
        present(alert, animated: true)
    }
    
    func termsOfUseNavigation() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/birdler-terms-of-use/37ac2e0e-8209-407d-b2fa-218db2997d64/terms")
    }
    
    func privacyNavigation() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/birdler-privacy-policy/c0033192-bd5c-493f-bb02-9742f367e22b/privacy")
    }
    
    
}
