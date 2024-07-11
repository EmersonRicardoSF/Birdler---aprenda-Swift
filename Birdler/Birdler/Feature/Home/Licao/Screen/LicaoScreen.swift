//
//  LicaoScreen.swift
//  Birdler
//
//  Created by Nayla on 31/5/2024.
//

import UIKit

class LicaoScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstrains()
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // IsEditable = False para que o usuario nao consiga editar o texto.
    //  textDragInteraction = False para que o usuário não troque a posição do texto.
    
    lazy var aulaConteudoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.textDragInteraction?.isEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.dataDetectorTypes = .link
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        textView.showsVerticalScrollIndicator = false
        
        return textView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(backgroundImageView)
        addSubview(aulaConteudoTextView)
        backgroundColor = .systemBackground
        
    }
    
    func setUpConstrains() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            aulaConteudoTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            aulaConteudoTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            aulaConteudoTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            aulaConteudoTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            
        ])
        
    }
}
