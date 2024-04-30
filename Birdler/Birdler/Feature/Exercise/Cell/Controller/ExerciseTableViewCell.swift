//
//  ExerciseTableViewCell.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 30/04/2024.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCellExercise"
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addElements()
        configConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func addElements() {
        addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
    }

}
