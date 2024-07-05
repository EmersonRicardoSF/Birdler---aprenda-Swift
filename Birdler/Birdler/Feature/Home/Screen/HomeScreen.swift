//
//  HomeScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func customNavigation()
    func tappedEnviarButton()
    func testNavigation()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var imageBackGround: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 16)
        label.text = "Olá, Nayla."
        
        return label
        
    }()
    
    
    lazy var tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .insetGrouped)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.showsVerticalScrollIndicator = false
        tableview.backgroundColor = .clear
        tableview.separatorStyle = .none
        tableview.register(HomeHeaderView.self, forHeaderFooterViewReuseIdentifier: HomeHeaderView.identifier)
        tableview.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        return tableview
    }()
    
    public func configProtocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    lazy var TestButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedTestButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedTestButton(sender: UIButton) {
        print("funcionando")
        delegate?.testNavigation()
        
        
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
        addSubview(greetingLabel)
        addSubview(tableView)
        addSubview(TestButton)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            imageBackGround.topAnchor.constraint(equalTo: topAnchor),
            imageBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            TestButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            TestButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            tableView.topAnchor.constraint(equalTo: greetingLabel.topAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        ])
    }
    
}
