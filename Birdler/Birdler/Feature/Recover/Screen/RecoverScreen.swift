//
//  RecoverScreen.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit

protocol RecoverScreenProtocol: AnyObject {
    func customNavigation()
    func tappedEnviarButton()
    
}

class RecoverScreen: UIView {
    private weak var delegate: RecoverScreenProtocol?
    public func delegate(delegate: RecoverScreenProtocol?) {
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

        // Definição das posições das cores
        gradient.locations = [
            NSNumber(value: 0.10),  // Posição 10%
            NSNumber(value: 0.37),  // Posição 37%
            NSNumber(value: 0.58),  // Posição 58%
            NSNumber(value: 0.87)   // Posição 87%
        ]

        // Definição do ponto inicial e final do gradiente
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
    
    lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 60)
        label.text = "Birdler"
        
        return label
        
    }()
    
    lazy var retangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 28
        
        return view
        
    }()
    
    lazy var recoverPass: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 21)
        label.text = "Esqueceu a senha?"
        label.textAlignment = .center
        label.textColor = UIColor(.black)
        
        return label
        
    }()
    
    lazy var textRecover: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite novamente o email abaixo e você receberá um email para configurar uma nova senha."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .gray
        
        return label
        
    }()
    
    lazy var emailImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Email")
        
        return image
        
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.layer.backgroundColor = .none
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "exemplo@gmail.com", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .gray
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = false
        textField.layer.borderColor = .none
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var enviarButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedEnviarButton), for: .touchUpInside)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    @objc func tappedEnviarButton(sender: UIButton) {
        print("Botão funcionando")
        delegate?.tappedEnviarButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(backgroundView)
        addSubview(loginLabel)
        addSubview(retangleView)
        retangleView.addSubview(recoverPass)
        retangleView.addSubview(textRecover)
        retangleView.addSubview(emailImageView)
        retangleView.addSubview(emailTextField)
        retangleView.addSubview(enviarButton)
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginLabel.bounds)
            self.loginLabel.textColor = self.gradientColor(bounds: self.loginLabel.bounds, gradientLayer: gradient)
            
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.enviarButton.bounds)
            self.enviarButton.backgroundColor = self.gradientColor(bounds: self.enviarButton.bounds, gradientLayer: gradient)
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.emailTextField.bounds)
            self.emailTextField.layer.borderColor = self.gradientColor(bounds: self.emailTextField.bounds, gradientLayer: gradient)?.cgColor
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            retangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            retangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            retangleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            retangleView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            
            recoverPass.topAnchor.constraint(equalTo: retangleView.topAnchor, constant: 45),
            recoverPass.leadingAnchor.constraint(equalTo: retangleView.leadingAnchor, constant: 80),
            recoverPass.trailingAnchor.constraint(equalTo: retangleView.trailingAnchor, constant: -80),
            recoverPass.heightAnchor.constraint(equalToConstant: 20),
            
            textRecover.topAnchor.constraint(equalTo: recoverPass.bottomAnchor, constant: 30),
            textRecover.leadingAnchor.constraint(equalTo: retangleView.leadingAnchor, constant: 25),
            textRecover.trailingAnchor.constraint(equalTo: retangleView.trailingAnchor, constant: -25),
            
            emailImageView.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            emailImageView.leadingAnchor.constraint(equalTo: retangleView.leadingAnchor, constant: 30),
            emailImageView.heightAnchor.constraint(equalToConstant: 20),
            emailImageView.widthAnchor.constraint(equalToConstant: 25),
            
            emailTextField.topAnchor.constraint(equalTo: textRecover.bottomAnchor, constant: 28),
            emailTextField.trailingAnchor.constraint(equalTo: enviarButton.trailingAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 5),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            enviarButton.heightAnchor.constraint(equalToConstant: 45),
            enviarButton.leadingAnchor.constraint(equalTo: retangleView.leadingAnchor, constant: 30),
            enviarButton.trailingAnchor.constraint(equalTo: retangleView.trailingAnchor, constant: -30),
            enviarButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -44),
            
        ])
    }
}
