//
//  LoginScreen.swift
//  Birdler
//
//  Created by Nayla on 30/3/2024.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        //order of gradient colors
        gradient.colors = [UIColor(red: 0.47, green: 0.05, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1).cgColor]
        // start and end points
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        //create UIImage by rendering gradient layer.
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //get gradient UIcolor from gradient UIImage
        return UIColor(patternImage: image!)
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        return imageView
        
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.customFont(type: .bold, size: 60)
        label.text = "Birdler"
       
        return label

    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .emailAddress
        textField.placeholder = "Usuário"
        textField.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = false
        textField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        textField.layer.borderWidth = 1

       
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.placeholder = "Senha"
        textField.isSecureTextEntry = true
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = false
        textField.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7).cgColor
        textField.layer.borderWidth = 1

        return textField
        
    }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.customFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(_ sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedLoginButton()
        
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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        //        addSubview(passwordImageView)
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginLabel.bounds)
            self.loginLabel.textColor = self.gradientColor(bounds: self.loginLabel.bounds, gradientLayer: gradient)
            
        }
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginButton.bounds)
            self.loginButton.backgroundColor = self.gradientColor(bounds: self.loginButton.bounds, gradientLayer: gradient)
        }
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
}
    
    
            
