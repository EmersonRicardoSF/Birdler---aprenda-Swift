//
//  RegisterScreen.swift
//  Birdler
//
//  Created by Vitor Ernane Guedes on 09/04/24.
//

import UIKit

class RegisterScreen: UIView {

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        
        return imageView
        
    }()
    
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.text = "Birdler"
        
        return label
        
    }()
    
    lazy var viewRegister: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        
        
        return view
        
    }()
    
    
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
        addSubview(viewRegister)
        
    }
    
    private func configConstrains() {
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            viewRegister.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,constant: 37),
            viewRegister.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            viewRegister.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            
            ])
                            
    }
}


