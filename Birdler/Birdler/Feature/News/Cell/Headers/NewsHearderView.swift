//
//  NewsHearderView.swift
//  Birdler
//
//  Created by Nayla on 27/4/2024.
//

import UIKit

class NewsHearderView: UITableViewHeaderFooterView {

    static let identifer = "NewsHearderView"
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Novidades"
        lbl.textColor = UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1)
        lbl.font = UIFont.poppinsFont(type: .bold , size: 32)
        return lbl
        
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

