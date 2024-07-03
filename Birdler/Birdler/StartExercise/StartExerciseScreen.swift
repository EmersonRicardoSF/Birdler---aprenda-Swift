//
//  StartExerciseScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//

import UIKit

protocol StartExerciseScreenProtocol: AnyObject {
    func customNavigation()
    
}

class StartExerciseScreen: UIView {
    
    private weak var delegate: StartExerciseScreenProtocol?
    
    public func delegate(delegate: StartExerciseScreenProtocol?) {
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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Bem vindo ao mega desafio Birdler"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
        
    }()
    
    lazy var iconUser: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "passarin")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        
        return image
        
    }()
    
    lazy var variadosButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Desafios variados", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 20)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = true
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(tappedVariadosButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedVariadosButton() {
        delegate?.customNavigation()
    }
    
    lazy var uikitButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Desafios UIKit", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 20)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .systemOrange.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(tappedUikitButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedUikitButton() {
        
    }
    
    lazy var swiftuiButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Desafios SwiftUI", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 20)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .systemOrange.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(tappedSwiftuiButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedSwiftuiButton() {
        
    }
    
    lazy var emBreveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Em breve!"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
        
    }()
    
    lazy var emBreveLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Em breve!"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
        
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoLabel)
        addSubview(iconUser)
        addSubview(variadosButton)
        addSubview(uikitButton)
        addSubview(swiftuiButton)
        addSubview(emBreveLabel)
        addSubview(emBreveLabel1)
        
    }
    
    
    private func ConfigConstraints() {
        NSLayoutConstraint.activate([
        
            logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            iconUser.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            iconUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconUser.widthAnchor.constraint(equalToConstant: 120),
            iconUser.heightAnchor.constraint(equalToConstant: 120),
            
            variadosButton.topAnchor.constraint(equalTo: iconUser.bottomAnchor, constant: 60),
            variadosButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            variadosButton.widthAnchor.constraint(equalToConstant: 200),
            
            uikitButton.topAnchor.constraint(equalTo: variadosButton.bottomAnchor, constant: 28),
            uikitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            uikitButton.widthAnchor.constraint(equalToConstant: 200),
            
            swiftuiButton.topAnchor.constraint(equalTo: uikitButton.bottomAnchor, constant: 28),
            swiftuiButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            swiftuiButton.widthAnchor.constraint(equalToConstant: 200),
            
            emBreveLabel.topAnchor.constraint(equalTo: uikitButton.topAnchor),
            emBreveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emBreveLabel1.topAnchor.constraint(equalTo: swiftuiButton.topAnchor),
            emBreveLabel1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        
        ])
        
    }
    
}


