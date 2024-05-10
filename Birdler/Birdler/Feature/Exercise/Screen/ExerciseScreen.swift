//
//  ExerciseScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 18/04/2024.
//

import UIKit

class ExerciseScreen: UIView {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear.withAlphaComponent(0.4)
        tv.layer.borderWidth = 2
        tv.layer.borderColor = UIColor.white.cgColor
        tv.layer.cornerRadius = 12
       // tv.layer.borderColor = .
        tv.register(HomeHeaderView.self, forHeaderFooterViewReuseIdentifier: HomeHeaderView.identifer)
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        
        return tv
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
        addSubview(backgroundImageView)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
