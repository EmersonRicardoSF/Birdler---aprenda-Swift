//
//  HomeTableViewCell.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/04/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func addSubView() {
        contentView.addSubview(screen)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
//<<<<<<< HEAD:Birdler/Birdler/Feature/Home/Cell/Controller/HomeTableViewCell.swift
//=======
    
//    public func setupHomeCell() {
//        screen.nameLabel.text = "Nome: "
//        screen.qtdLabel.text = "Quantidade: "
//        screen.phoneLabel.text = "Telefone: "
//        screen.timeLabel.text = "Horário: "
//    }

//>>>>>>> Feature/Home:Birdler/Birdler/Home/Cell/Controller/HomeTableViewCell.swift
}
