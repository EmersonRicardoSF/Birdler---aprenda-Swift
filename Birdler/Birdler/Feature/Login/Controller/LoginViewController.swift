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
        let isLoginEnabled = !isEmailEmpty && !isPasswordEmpty
        loginScreen?.loginButton.isEnabled = isLoginEnabled
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func ContinueWhitoutLoginNavigation() {
        let tabBarVC = TabBarVC()
        tabBarVC.modalPresentationStyle = .fullScreen // Ajuste de apresentação
        
        let navController = UINavigationController(rootViewController: tabBarVC)
        navController.modalPresentationStyle = .fullScreen // Ajuste de apresentação
        present(navController, animated: true, completion: nil)
    }
    
    func tappedRecuperarSenhaButton() {
        print("Recuperar Senha")
        let vc = RecoverVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedLoginButton() {
        print("Entrar")
        let email = loginScreen?.usuarioTextField.text ?? ""
        let senha = loginScreen?.passwordTextField.text ?? ""
        logarUsuario(email: email, senha: senha)
    }
    
    func tappedCriarCadastroButton() {
        print("Criar Cadastro")
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func logarUsuario(email: String, senha: String) {
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] result, error in
            if let error = error {
                print("Erro ao logar: \(error.localizedDescription)")
                let alert = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true, completion: nil)
            } else {
                print("Sucesso! O usuário está logado")
                UserDefaults.standard.set(true, forKey: "UsuarioLogado")
                let tabBarVC = TabBarVC()
                tabBarVC.modalPresentationStyle = .fullScreen
                self?.present(tabBarVC, animated: true, completion: nil)
            }
        }
    }
}
