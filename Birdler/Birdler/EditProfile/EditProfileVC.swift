//
//  EditProfileVC.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/07/2024.
//

import UIKit
import FirebaseAuth

class EditProfileVC: UIViewController {
    
    var editProfileScreen: EditProfileScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        editProfileScreen?.delegate(delegate: self)

    }
    
    override func loadView() {
        editProfileScreen = EditProfileScreen()
        view = editProfileScreen
    }
    
    func deleteAccount(withPassword password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser, let email = user.email else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum usuário logado"])))
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        user.reauthenticate(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                user.delete { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    private func resetLoginState() {
        
        NotificationCenter.default.post(name: Notification.Name("UserLoggedOut"), object: nil)
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

extension EditProfileVC: EditProfileScreenProtocol {
    
    func EditProfileNavigation() {
        
    }
    
    func DeleteAccountNavigation() {
        let alert = UIAlertController(title: "Apagar conta", message: "Digite sua senha para deletar sua conta. Ao apagar todos os dados serão perdidos:", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Senha"
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: { [weak self] _ in
            guard let self = self,
                  let textFields = alert.textFields,
                  let password = textFields.first?.text,
                  !password.isEmpty else {
                self?.showAlert(title: "Erro", message: "Senha não pode estar vazia")
                return
            }
            self.deleteAccount(withPassword: password) { result in
                switch result {
                case .success:
                    // Limpar o estado de login
                    self.resetLoginState()
                    // Redirecionar para a tela de login
                    self.navigateToLogin()
                case .failure(let error):
                    self.showAlert(title: "Erro", message: error.localizedDescription)
                }
            }
        }))
        present(alert, animated: true)
    }
    
}
