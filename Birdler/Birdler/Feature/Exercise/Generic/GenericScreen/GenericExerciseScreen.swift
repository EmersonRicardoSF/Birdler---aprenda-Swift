import UIKit

protocol GenericExerciseScreenProtocol: AnyObject {
    func customNavigation()
  
}

class GenericExerciseScreen: UIView {
    
    private weak var delegate: GenericExerciseScreenProtocol?
    
    public func delegate(delegate: GenericExerciseScreenProtocol?) {
        self.delegate = delegate
    }
    
    var correctAnswer: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageBackGround: UIImageView = {
        let image = UIImageView(image: UIImage(named: "background"))
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = UIColor(red: 0xF0/255.0, green: 0x51/255.0, blue: 0x38/255.0, alpha: 1)
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
    
    lazy var exerciseButtonLeft: UIButton = createButton(selector: #selector(tappedButton(_:)))
    lazy var exerciseButtonMiddle: UIButton = createButton(selector: #selector(tappedButton(_:)))
    lazy var exerciseButtonRight: UIButton = createButton(selector: #selector(tappedButton(_:)))
    
    private var buttons: [UIButton] {
        return [exerciseButtonLeft, exerciseButtonMiddle, exerciseButtonRight]
    }
    
    
    
    private func createButton(selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .gray
        button.setTitle("Your Title", for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        // Use UIButton.Configuration para configurar a aparência e o layout do botão
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .gray
        config.titlePadding = 16
        config.cornerStyle = .capsule // Define o estilo do canto como cápsula
        button.configuration = config
        
        return button
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        for button in buttons {
            if let buttonTitle = button.currentTitle {
                button.backgroundColor = buttonTitle == correctAnswer ? .systemGreen : .systemRed
            }
        }
    }
    
    private lazy var nextQuestionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 0x15/255.0, green: 0x75/255.0, blue: 0xF6/255.0, alpha: 1.0)
        button.setTitle("Próxima Pergunta", for: .normal)
        button.addTarget(self, action: #selector(nextQuestionButtonTapped), for: .touchUpInside)
        
        // Use UIButton.Configuration para configurar a aparência e o layout do botão
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = UIColor(red: 0x15/255.0, green: 0x75/255.0, blue: 0xF6/255.0, alpha: 1.0)
        config.titlePadding = 16
        config.cornerStyle = .capsule // Define o estilo do canto como cápsula
        button.configuration = config
        
        return button
    }()
    
    @objc private func nextQuestionButtonTapped() {
        delegate?.customNavigation()
    }
    
    func configureView(with question: Config.Question) {
        titleLabel.text = question.titleLabel.text
        questionsLabel.text = question.questionsLabel.text
        correctAnswer = question.correctAnswer
        
        for (index, button) in buttons.enumerated() {
            if index < question.exerciseButtons.count {
                let buttonData = question.exerciseButtons[index]
                button.setTitle(buttonData.title, for: .normal)
                button.isEnabled = buttonData.enabled
                button.backgroundColor = UIColor.gray
            }
        }
    }
    
    private func addElements() {
        addSubview(imageBackGround)
        addSubview(titleLabel)
        addSubview(questionsLabel)
        addSubview(exerciseButtonLeft)
        addSubview(exerciseButtonMiddle)
        addSubview(exerciseButtonRight)
        addSubview(nextQuestionButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
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
            
            nextQuestionButton.topAnchor.constraint(equalTo: exerciseButtonRight.bottomAnchor, constant: 40),
            nextQuestionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

