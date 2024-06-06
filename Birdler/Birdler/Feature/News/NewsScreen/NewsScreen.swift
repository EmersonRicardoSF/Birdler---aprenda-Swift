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
        let btn: UIButton = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Documentação Apple Developer", for: .normal)
        btn.titleLabel?.font = UIFont.poppinsFont(type: .regular, size: 13)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(opendoc), for: .touchUpInside)
        
        return btn
        
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(NewsHearderView.self, forHeaderFooterViewReuseIdentifier: NewsHearderView.identifer)
        return tv
        
    }()
    
    
    @objc func opendoc() {
        print("Indo para a Web")
    }
    
    @objc func tappedDocAppleDevButton() {
        print("Indo para a Web")
//        self.delegate?.tappedDocAppleDevButton()
        
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
//            docAppleDevButton.heightAnchor.constraint(equalToConstant: 24),

            docAppleDevImageView.centerYAnchor.constraint(equalTo: docAppleDevButton.centerYAnchor),
            docAppleDevImageView.leadingAnchor.constraint(equalTo: docAppleDevButton.leadingAnchor, constant: 32),
            
            tableView.topAnchor.constraint(equalTo: docAppleDevButton.topAnchor, constant: 44),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        
        ])
    }
    
}
