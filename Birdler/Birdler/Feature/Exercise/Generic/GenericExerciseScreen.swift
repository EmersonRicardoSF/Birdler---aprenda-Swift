//
//  GenericExerciseScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 10/06/2024.
//

import UIKit

class GenericExerciseScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 20)
        label.textAlignment = .left
        label.textColor = .systemOrange
        label.text = "Quando o Swift foi criado?"
        
        
        return label
        
    }()
    
    lazy var questionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Swift é uma linguagem de programação desenvolvida pela Apple e implementada em: "
        
        return label
        
    }()
    
    lazy var exerciseButtonLeft: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2014", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tappedExerciseButtonLeft), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedExerciseButtonLeft() {
        print("leftButton")
    }
    
    lazy var exerciseButtonMiddle: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2012", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tappedExerciseButtonMiddle), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedExerciseButtonMiddle() {
        print("MiddleButton")
    }
    
    lazy var exerciseButtonRight: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2016", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tappedExerciseButtonRight), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedExerciseButtonRight() {
        print("RightButton")
    }
    
    
    lazy var imageBackGround: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(imageBackGround)
        addSubview(titleLabel)
        addSubview(questionsLabel)
        addSubview(exerciseButtonLeft)
        addSubview(exerciseButtonMiddle)
        addSubview(exerciseButtonRight)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            imageBackGround.topAnchor.constraint(equalTo: topAnchor),
            imageBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            questionsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            questionsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            questionsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            exerciseButtonLeft.topAnchor.constraint(equalTo: questionsLabel.bottomAnchor, constant: 40),
            exerciseButtonLeft.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            exerciseButtonLeft.widthAnchor.constraint(equalToConstant: 80),
            
            exerciseButtonMiddle.topAnchor.constraint(equalTo: exerciseButtonLeft.topAnchor),
            exerciseButtonMiddle.centerXAnchor.constraint(equalTo: centerXAnchor),
            exerciseButtonMiddle.widthAnchor.constraint(equalToConstant: 80),
            
            exerciseButtonRight.topAnchor.constraint(equalTo: exerciseButtonLeft.topAnchor),
            exerciseButtonRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            exerciseButtonRight.widthAnchor.constraint(equalToConstant: 80),
        
        
        ])
    }
    
}
