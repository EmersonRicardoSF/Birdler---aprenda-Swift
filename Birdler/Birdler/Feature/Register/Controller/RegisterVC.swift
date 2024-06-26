import UIKit
import Firebase
import FirebaseAuth

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
        Auth.auth().createUser(withEmail: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "") { sucesso, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Usuário foi cadastrado..")
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
