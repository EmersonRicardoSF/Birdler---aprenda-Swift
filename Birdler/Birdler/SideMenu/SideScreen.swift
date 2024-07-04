//
//  SideScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//

import UIKit

protocol SideScreenProtocol: AnyObject {
    func customNavigation()
}

class SideScreen: UIView {
    
    private weak var delegate: SideScreenProtocol?
    
    public func delegate(delegate: SideScreenProtocol?) {
        self.delegate = delegate
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        ConfigConstraints()
    }
    
  
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 28)
        label.text = "Ajustes"
        label.textColor = .white
        
        return label
        
    }()
    
    lazy var iconUser: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "teste2")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        
        return image
        
    }()
    
    lazy var editProfileButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar perfil", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 22)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tappedEditProfileButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedEditProfileButton() {
        delegate?.customNavigation()
    }
    
    lazy var logoutButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sair", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 22)
        button.setTitleColor(.systemRed, for: .normal)
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedLogoutButton() {
        
    }
    
    lazy var termsOfUseButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Termos de uso", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 14)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tappedTermsOfUseButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedTermsOfUseButton() {
        
    }

    lazy var privacyButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Política de privacidade", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 14)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(tappedTermsOfUseButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedPrivacyButton() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoLabel)
        addSubview(iconUser)
        addSubview(editProfileButton)
        addSubview(logoutButton)
        addSubview(termsOfUseButton)
        addSubview(privacyButton)
        
    }
    
    
    private func ConfigConstraints() {
        NSLayoutConstraint.activate([
        
            logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            iconUser.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            iconUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconUser.widthAnchor.constraint(equalToConstant: 120),
            iconUser.heightAnchor.constraint(equalToConstant: 120),
            
            editProfileButton.topAnchor.constraint(equalTo: iconUser.bottomAnchor, constant: 52),
            editProfileButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            editProfileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            editProfileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            logoutButton.topAnchor.constraint(equalTo: editProfileButton.bottomAnchor, constant: 40),
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            termsOfUseButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 72),
            termsOfUseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            privacyButton.topAnchor.constraint(equalTo: termsOfUseButton.bottomAnchor, constant: 8),
            privacyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        
        
        ])
        
    }
    
}
