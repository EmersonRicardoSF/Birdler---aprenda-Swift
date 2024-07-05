//
//  NewsScreen.swift
//  Birdler
//
//  Created by Nayla on 20/4/2024.
//

import UIKit

protocol NewsScreenProtocol: AnyObject {
    func tappedDocAppleDevButton()
    
}

class NewsScreen: UIView {
    
    private weak var delegate: NewsScreenProtocol?
    
    public func delegate(delegate: NewsScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        return imageView
        
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 16)
        label.text = "Olá, Nayla."
        
        return label
        
    }()
    
    lazy var docAppleDevImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "applelogo")
        image.tintColor = .black
        return image
        
    }()
    
    lazy var docAppleDevButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Documentação Apple Developer", for: .normal)
        button.titleLabel?.font = UIFont.poppinsFont(type: .regular, size: 13)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(NewsHearderView.self, forHeaderFooterViewReuseIdentifier: NewsHearderView.identifier)
        return tableView
        
    }()
    
    
    @objc func buttonTapped() {
        print("Indo para a Web")
        self.delegate?.tappedDocAppleDevButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstrains()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
    
    func addElements(){
        addSubview(backgroundImageView)
        addSubview(greetingLabel)
        addSubview(tableView)
        addSubview(docAppleDevButton)
        docAppleDevButton.addSubview(docAppleDevImageView)
        
    }

    
    func configConstrains(){
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            greetingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            docAppleDevButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            docAppleDevButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
            docAppleDevButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -38),

            docAppleDevImageView.centerYAnchor.constraint(equalTo: docAppleDevButton.centerYAnchor),
            docAppleDevImageView.leadingAnchor.constraint(equalTo: docAppleDevButton.leadingAnchor, constant: 26),
            
            tableView.topAnchor.constraint(equalTo: docAppleDevButton.topAnchor, constant: 54),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        
        ])
    }
    
}

