import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    func updateUserProfile(name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum usuário logado"])))
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(user.uid).updateData(["nome": name]) { error in
            if let error = error {
                print("Firestore update error: \(error.localizedDescription)")
                completion(.failure(error))
            } else {
                print("Profile updated successfully")
                completion(.success(()))
            }
        }
    }
    
    func deleteAccount(withPassword password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser, let email = user.email else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum usuário logado"])))
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        user.reauthenticate(with: credential) { authResult, error in
            if let error = error {
                print("Reauthentication error: \(error.localizedDescription)")
                completion(.failure(error))
            } else {
                user.delete { error in
                    if let error = error {
                        print("Account deletion error: \(error.localizedDescription)")
                        completion(.failure(error))
                    } else {
                        print("Account deleted successfully")
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
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension EditProfileVC: EditProfileScreenProtocol {
    func EditProfileNavigation() {
        guard let name = editProfileScreen?.userTextField.text, !name.isEmpty else {
            showAlert(title: "Erro", message: "Nome não pode estar vazio")
            return
        }
        
        updateUserProfile(name: name) { result in
            switch result {
            case .success:
                self.showAlert(title: "Sucesso", message: "Perfil atualizado com sucesso") {
                    self.navigateToLogin()
                }
            case .failure(let error):
                self.showAlert(title: "Erro", message: error.localizedDescription)
            }
        }
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
                    self.resetLoginState()
                    self.navigateToLogin()
                case .failure(let error):
                    self.showAlert(title: "Erro", message: error.localizedDescription)
                }
            }
        }))
        present(alert, animated: true)
    }
}
