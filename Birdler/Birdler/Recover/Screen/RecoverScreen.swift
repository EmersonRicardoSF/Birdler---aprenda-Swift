//
//  RecoverScreen.swift
//  Birdler
//
//  Created by Emerson Ricardo Saia Filho on 11/04/24.
//

import UIKit

protocol RecoverScreenProtocol: AnyObject {
    func customNavigation()
}

class RecoverScreen: UIView {
    private weak var delegate: HomeScreenProtocol?
    public func delegate(delegate: HomeScreenProtocol?) {
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
    
    lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var retangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
        label.text = "Confirme o email abaixo e você recebera um, email para configurar nova senha."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        //        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 60)
        label.text = "Birdler"
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
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
        retangleView.addSubview(loginButton)
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginLabel.bounds)
            self.loginLabel.textColor = self.gradientColor(bounds: self.loginLabel.bounds, gradientLayer: gradient)
            
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.loginButton.bounds)
            self.loginButton.backgroundColor = self.gradientColor(bounds: self.loginButton.bounds, gradientLayer: gradient)
            
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
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
            
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.leadingAnchor.constraint(equalTo: retangleView.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: retangleView.trailingAnchor, constant: -30),
            loginButton.topAnchor.constraint(equalTo: textRecover.bottomAnchor, constant: 30)
        ])
    }
}
