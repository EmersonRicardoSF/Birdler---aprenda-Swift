import UIKit

class GenericExerciseScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 20)
        label.textAlignment = .left
        label.textColor = .systemOrange
        return label
    }()
    
    lazy var questionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var exerciseButtonLeft: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.setTitle("Your Title", for: .normal)
        
        // Use UIButton.Configuration para configurar a aparência e o layout do botão
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .gray
        config.titlePadding = 16
        config.cornerStyle = .capsule // Define o estilo do canto como cápsula
        button.configuration = config
        
        return button
    }()
    
    lazy var exerciseButtonMiddle: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.setTitle("Your Title", for: .normal)
        
        // Use UIButton.Configuration para configurar a aparência e o layout do botão
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .gray
        config.titlePadding = 16
        config.cornerStyle = .capsule // Define o estilo do canto como cápsula
        button.configuration = config
        
        return button
    }()
    
        lazy var exerciseButtonRight: UIButton = {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
            button.setTitleColor(.white, for: .normal)
            button.isEnabled = false
            button.clipsToBounds = true
            button.layer.cornerRadius = 7.5
            button.backgroundColor = .gray
            button.setTitle("Your Title", for: .normal)
            
            // Use UIButton.Configuration para configurar a aparência e o layout do botão
            var config = UIButton.Configuration.plain()
            config.baseBackgroundColor = .gray
            config.titlePadding = 16
            config.cornerStyle = .capsule // Define o estilo do canto como cápsula
            button.configuration = config
            
            return button
        }()
    
    lazy var imageBackGround: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
        addSubview(titleLabel)
        addSubview(questionsLabel)
        addSubview(exerciseButtonLeft)
        addSubview(exerciseButtonMiddle)
        addSubview(exerciseButtonRight)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            imageBackGround.topAnchor.constraint(equalTo: topAnchor),
            imageBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageBackGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            questionsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            questionsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            questionsLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            exerciseButtonLeft.topAnchor.constraint(equalTo: questionsLabel.bottomAnchor, constant: 40),
            exerciseButtonLeft.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            exerciseButtonMiddle.topAnchor.constraint(equalTo: exerciseButtonLeft.bottomAnchor, constant: 20),
            exerciseButtonMiddle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            exerciseButtonRight.topAnchor.constraint(equalTo: exerciseButtonMiddle.bottomAnchor, constant: 20),
            exerciseButtonRight.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
}

