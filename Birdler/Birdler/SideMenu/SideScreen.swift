//
//  SideScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 03/07/2024.
//

import UIKit

class SideScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        ConfigConstraints()
    }
    
  
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
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
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(logoLabel)
        addSubview(iconUser)
        
    }
    
    
    private func ConfigConstraints() {
        NSLayoutConstraint.activate([
        
            logoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            iconUser.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            iconUser.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconUser.widthAnchor.constraint(equalToConstant: 120),
            iconUser.heightAnchor.constraint(equalToConstant: 120),
        
        ])
        
    }
    
}
