import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class RegisterVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        registerScreen = RegisterScreen()
        self.view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
    }
    
    func registrarUsuario() {
        guard let email = registerScreen?.emailTextField.text,
              let password = registerScreen?.passwordTextField.text,
              let nome = registerScreen?.userTextField.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { sucesso, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Usuário foi cadastrado..")
                
                // Adiciona o nome do usuário no Firestore
                if let userID = Auth.auth().currentUser?.uid {
                    let db = Firestore.firestore()
                    db.collection("users").document(userID).setData([
                        "nome": nome,
                        "email": email
                    ]) { error in
                        if let error = error {
                            print("Erro ao salvar o nome do usuário: \(error.localizedDescription)")
                        } else {
                            print("Nome do usuário salvo com sucesso.")
                        }
                    }
                }
            }
        }
    }

    func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            registerScreen?.profileImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedCadastrarButton() {
        print("clicou no botao")
        let vc: LoginVC = LoginVC()
        registrarUsuario()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedProfileImageButton() {
        showImagePickerController()
    }
}
