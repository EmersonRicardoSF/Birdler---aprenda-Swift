//
//  HomeScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func customNavigation()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .white
        tv.layer.cornerRadius = 12
        tv.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        return tv
    }()
    
    lazy var imageBackGround: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
    public func configProtocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(imageBackGround)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageBackGround.topAnchor.constraint(equalTo: topAnchor),
            imageBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.widthAnchor.constraint(equalToConstant: 340),
            tableView.heightAnchor.constraint(equalToConstant: 300),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
        ])
    }
    
}
