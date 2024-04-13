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
    
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.text = "Birdler"
        
        return label
        
    }()
    
    lazy var viewRegister: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        
        
        return view
        
    }()
    
    lazy var profilePhoto: UIImageView = {
    
        let imageView = UIImageView(image: UIImage(named: "photoProfile"))
        return imageView
        
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
        addSubview(logoLabel)
        addSubview(viewRegister)
        viewRegister.addSubview(profilePhoto)
        
        DispatchQueue.main.async {
            
            let gradient = self.getGradientLayer(bounds: self.logoLabel.bounds)
            self.logoLabel.textColor = self.gradientColor(bounds: self.logoLabel.bounds, gradientLayer: gradient)
            
        }
        
    }
    
    private func configConstrains() {
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            viewRegister.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewRegister.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewRegister.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewRegister.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 50),
            
            logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            profilePhoto.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 57),
            profilePhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
            
                   
            ])
                
        
           
    }
}


