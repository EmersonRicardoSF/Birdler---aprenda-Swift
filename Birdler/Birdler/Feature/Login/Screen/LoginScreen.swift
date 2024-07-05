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
    func ContinueWhitouLoginNavigation()
    
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            UIColor(red: 0x15/255.0, green: 0x75/255.0, blue: 0xF6/255.0, alpha: 1.0).cgColor,  // Azul Xcode (posição 10%)
            UIColor(red: 0x6A/255.0, green: 0x0D/255.0, blue: 0xAD/255.0, alpha: 1.0).cgColor,  // Roxo (posição 37%)
            UIColor(red: 0x5A/255.0, green: 0x0D/255.0, blue: 0xAE/255.0, alpha: 1.0).cgColor,  // Subton de Roxo (posição 58%)
            UIColor(red: 0xF0/255.0, green: 0x51/255.0, blue: 0x38/255.0, alpha: 1.0).cgColor   // Swift Orange (posição 87%)
        ]
        gradient.locations = [
            NSNumber(value: 0.10),  // Posição 10%
            NSNumber(value: 0.37),  // Posição 37%
            NSNumber(value: 0.58),  // Posição 58%
            NSNumber(value: 0.87)   // Posição 87%
        ]
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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 60)
        label.text = "Birdler"
        
        return label
        
    }()
    
    lazy var usuarioTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "Usuário", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.99)])
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = false
        textField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        textField.layer.borderWidth = 1
        textField.autocapitalizationType = .none
        textField.textColor = .white
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var usuarioImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Person")
        
        return image
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.99)])
        textField.isSecureTextEntry = true
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = false
        textField.autocapitalizationType = .none
        textField.textColor = .white
        textField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        textField.layer.borderWidth = 1
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var passwordImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Key")
        
        return image
        
    }()
    
    lazy var recuperarSenhaButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar Senha", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .medium, size: 15)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedRecuperarSenhaButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var criarCadastroButton: UIButton = {
        let button: UIButton = UIButton()
        let attributedString = NSMutableAttributedString(string: "Não possui cadastro? Crie aqui")
        let range = NSRange(location: 21, length: 9)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1), range: range)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.font = UIFont.dmsansFont(type: .regular, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedCriarCadastroButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var continueWithoutLoginButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("Continuar sem login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.dmsansFont(type: .bold, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedContinueWhitoutLoginButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedContinueWhitoutLoginButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.ContinueWhitouLoginNavigation()
        
    }
    
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
        addSubview(continueWithoutLoginButton)
        
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
            
            continueWithoutLoginButton.topAnchor.constraint(equalTo: criarCadastroButton.bottomAnchor, constant: 20),
            continueWithoutLoginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            continueWithoutLoginButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            continueWithoutLoginButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        usuarioTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}



