//
//  FirstGameScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 15/07/2024.
//

import UIKit

class FirstGameScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var TestButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "botao"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var TestButton2: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "botao"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var TestButton3: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "botao"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var TestButton4: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "botao"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        return button
        
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
    
    @objc func tappedTestButton(sender: UIButton) {
        print("funcionando")
        
        
    }
    
    private func addElements() {
        addSubview(backgroundImageView)
        addSubview(TestButton)
        addSubview(iconUser)
        addSubview(TestButton2)
    }
  
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            TestButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            TestButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            TestButton.widthAnchor.constraint(equalToConstant: 80),
            TestButton.heightAnchor.constraint(equalToConstant: 80),
            
            iconUser.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconUser.widthAnchor.constraint(equalToConstant: 80),
            iconUser.heightAnchor.constraint(equalToConstant: 80),
            
            TestButton2.topAnchor.constraint(equalTo: iconUser.bottomAnchor, constant: 60),
            TestButton2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            TestButton2.widthAnchor.constraint(equalToConstant: 80),
            TestButton2.heightAnchor.constraint(equalToConstant: 80),
            
        
        ])
    }
    
}
