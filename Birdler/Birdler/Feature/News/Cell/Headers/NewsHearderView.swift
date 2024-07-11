// NewsHearderView.swift
// Birdler
//
// Created by Nayla on 27/4/2024.
//

import UIKit

class NewsHearderView: UITableViewHeaderFooterView {

    static let identifier = "NewsHearderView"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Novidades"
        label.textColor = UIColor(red: 0xF0/255.0, green: 0x51/255.0, blue: 0x38/255.0, alpha: 1.0)
        label.font = UIFont.poppinsFont(type: .bold, size: 24)
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
        contentView.addSubview(nameLabel)
        contentView.backgroundColor = .clear
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
