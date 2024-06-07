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
        button.addTarget(self, action: #selector(opendoc), for: .touchUpInside)
        
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
    
    
    @objc func opendoc() {
        print("Indo para a Web")
    }
    
    @objc func tappedDocAppleDevButton() {
        print("Indo para a Web")
        
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
        backgroundImageView.addSubview(docAppleDevButton)
        backgroundImageView.addSubview(docAppleDevImageView)
        addSubview(tableView)
        
    }
    
    func configConstrains(){
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            docAppleDevButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            docAppleDevButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            docAppleDevButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -22),
          
            docAppleDevImageView.centerYAnchor.constraint(equalTo: docAppleDevButton.centerYAnchor),
            docAppleDevImageView.leadingAnchor.constraint(equalTo: docAppleDevButton.leadingAnchor, constant: 32),
            
            tableView.topAnchor.constraint(equalTo: docAppleDevButton.topAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        
        ])
    }
    
}
