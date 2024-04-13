//
//  HomeHeaderView.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 06/04/2024.
//

import UIKit

class HomeHeaderView: UITableViewHeaderFooterView {
    
    static let identifer = "HomeHeaderView"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Meu progresso: "
        label.textColor = UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1)
        label.font = UIFont.poppinsFont(type: .bold , size: 20)
        return label
        
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func addElements() {
        addSubview(nameLabel)
        self.backgroundColor = .clear
        self.backgroundView?.backgroundColor = .clear
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        
        ])
    }
    
}
