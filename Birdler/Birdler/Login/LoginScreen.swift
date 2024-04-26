//
//  LoginScreen.swift
//  Birdler
//
//  Created by Nayla on 30/3/2024.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRecuperarSenhaButton()
    func tappedCriarCadastroButton()
    
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor(red: 0.47, green: 0.05, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image!)
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        
        return imageView
        
    }()
    
    lazy var loginLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.dmsansFont(type: .bold, size: 60)
        lbl.text = "Birdler"
        
        return lbl
        
    }()
    
    lazy var usuarioTextField: UITextField = {
        let tf = UITextField()
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Usuário", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.99)])
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.layer.cornerRadius = 8
        tf.layer.masksToBounds = false
        tf.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        tf.layer.borderWidth = 1
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 28))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        
        return tf
        
    }()
    
    lazy var usuarioImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "Person")
        
            return image
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        tf.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        tf.keyboardType = .alphabet
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.99)])
        tf.isSecureTextEntry = true
        tf.font = UIFont.boldSystemFont(ofSize: 20)
        tf.layer.cornerRadius = 8
        tf.layer.masksToBounds = false
        tf.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        tf.layer.borderWidth = 1
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 28))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        
        return tf
        
    }()
    
    lazy var passwordImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: "Key")
        
            return image
        
        }()
    
    lazy var recuperarSenhaButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Recuperar Senha", for: .normal)
        btn.titleLabel?.font = UIFont.urbanistFont(type: .medium, size: 15)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(tappedRecuperarSenhaButton), for: .touchUpInside)
        
        return btn
        
    }()
    
    lazy var loginButton: UIButton = {
        let btn: UIButton = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Entrar", for: .normal)
        btn.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        btn.setTitleColor(.white, for: .normal)
        btn.isEnabled = false
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return btn
        
    }()
    
    lazy var criarCadastroButton: UIButton = {
        let btn: UIButton = UIButton()
        let attributedString = NSMutableAttributedString(string: "Não possui cadastro? Crie aqui")
        let range = NSRange(location: 21, length: 9)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1), range: range)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.titleLabel?.font = UIFont.dmsansFont(type: .regular, size: 19)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(tappedCriarCadastroButton), for: .touchUpInside)
        
        return btn
        
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedLoginButton()
        
    }
    
    @objc func tappedRecuperarSenhaButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedRecuperarSenhaButton()
        
    }
    
    @objc func tappedCriarCadastroButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedCriarCadastroButton()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func addElements() {
        addSubview(backgroundImageView)
        addSubview(loginLabel)
        addSubview(usuarioTextField)
        addSubview(usuarioImageView)
        addSubview(passwordTextField)
        addSubview(passwordImageView)
        addSubview(recuperarSenhaButton)
        addSubview(loginButton)
        addSubview(criarCadastroButton)
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginLabel.bounds)
            self.loginLabel.textColor = self.gradientColor(bounds: self.loginLabel.bounds, gradientLayer: gradient)
            
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginButton.bounds)
            self.loginButton.backgroundColor = self.gradientColor(bounds: self.loginButton.bounds, gradientLayer: gradient)?.withAlphaComponent(0.5)
            
        }
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            usuarioTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            usuarioTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            usuarioTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            usuarioTextField.heightAnchor.constraint(equalToConstant: 50),
            
            usuarioImageView.centerYAnchor.constraint(equalTo: usuarioTextField.centerYAnchor),
            usuarioImageView.leadingAnchor.constraint(equalTo: usuarioTextField.leadingAnchor, constant: 15),
            
            passwordTextField.topAnchor.constraint(equalTo: usuarioTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: usuarioTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usuarioTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: usuarioTextField.heightAnchor),
            
            passwordImageView.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordImageView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 15),
            
            recuperarSenhaButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0),
            recuperarSenhaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
            recuperarSenhaButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            recuperarSenhaButton.heightAnchor.constraint(equalToConstant: 45),
            
            loginButton.topAnchor.constraint(equalTo: recuperarSenhaButton.bottomAnchor, constant: 0),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            criarCadastroButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            criarCadastroButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            criarCadastroButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            criarCadastroButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        usuarioTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}



