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
        label.frame = CGRect(x: 0, y: 0, width: 338, height: 16)
        label.text = "Confirme o email abaixo e você recebera um, email para configurar nova senha."
        label.textAlignment = .center
        label.textColor = UIColor(.black)
        return label
    }()
    
    lazy var enviarButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ENVIAR", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 17 )
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            retangleView.heightAnchor.constraint(equalToConstant: 740),
            retangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            retangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            retangleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            recoverPass.topAnchor.constraint(equalTo: retangleView.topAnchor, constant: 45),
            recoverPass.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            recoverPass.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            recoverPass.heightAnchor.constraint(equalToConstant: 20),
            
            textRecover.topAnchor.constraint(equalTo: recoverPass.bottomAnchor, constant: 30),
            textRecover.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textRecover.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            textRecover.heightAnchor.constraint(equalToConstant: 40),
            
            enviarButton.heightAnchor.constraint(equalToConstant: 50),
            enviarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            enviarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            enviarButton.topAnchor.constraint(equalTo: retangleView.topAnchor, constant: 270)
        ])
    }
}
