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
    var remainingAttempts: Int {
        get {
            return UserDefaults.standard.integer(forKey: "remainingAttempts")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "remainingAttempts")
            updateLivesLabel()
        }
    }
    var maxAttempts: Int = 3
    var lifeTimer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeRemainingAttempts()
        addElements()
        configConstraints()
        startLifeTimer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeRemainingAttempts() {
        if UserDefaults.standard.object(forKey: "remainingAttempts") == nil {
            remainingAttempts = maxAttempts
        } else {
            checkAndRestoreLives()
        }
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
    
    lazy var livesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.dmsansFont(type: .bold, size: 14)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "♥️ \(remainingAttempts)"
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
        
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .gray
        config.titlePadding = 16
        config.cornerStyle = .capsule
        button.configuration = config
        
        return button
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        if title == correctAnswer {
            sender.backgroundColor = .systemGreen
        } else {
            remainingAttempts -= 1
            updateLivesLabel()
            
            if remainingAttempts <= 0 {
                remainingAttempts = 0
                showAlertForNoAttemptsLeft()
            }
            
            sender.backgroundColor = .systemRed
        }
        
        updateButtonsState()
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
        
        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = UIColor(red: 0x15/255.0, green: 0x75/255.0, blue: 0xF6/255.0, alpha: 1.0)
        config.titlePadding = 16
        config.cornerStyle = .capsule
        button.configuration = config
        
        return button
    }()
    
    @objc private func nextQuestionButtonTapped() {
        if remainingAttempts > 0 {
            delegate?.customNavigation()
            resetButtonsState()
        } else {
            showAlertForNoAttemptsLeft()
        }
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
    
    private func checkAndRestoreLives() {
        let lastRestoredDate = UserDefaults.standard.object(forKey: "lastRestoredDate") as? Date ?? Date()
        let timeIntervalSinceLastRestore = Date().timeIntervalSince(lastRestoredDate)
        let hoursSinceLastRestore = Int(timeIntervalSinceLastRestore / 3600)
        
        if hoursSinceLastRestore > 0 {
            remainingAttempts = min(maxAttempts, remainingAttempts + hoursSinceLastRestore)
            UserDefaults.standard.set(Date(), forKey: "lastRestoredDate")
        }
        
        updateLivesLabel()
        
        if remainingAttempts > 0 {
            nextQuestionButton.isEnabled = true
        } else {
            nextQuestionButton.isEnabled = false
        }
        //updateLivesLabel()
    }
    
    func startLifeTimer() {
        lifeTimer = Timer.scheduledTimer(timeInterval: 3600, target: self, selector: #selector(addLife), userInfo: nil, repeats: true)
        checkAndRestoreLives()
    }

    @objc func addLife() {
        if remainingAttempts < maxAttempts {
            remainingAttempts += 1
            UserDefaults.standard.set(Date(), forKey: "lastRestoredDate")
        }
    }
    
    private func showAlertForNoAttemptsLeft() {
        let alert = UIAlertController(title: "Fim das tentativas", message: "Você usou todas as suas tentativas. Aguarde até que as vidas sejam restauradas.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        if let viewController = self.window?.rootViewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        
        nextQuestionButton.isEnabled = false
    }
    
    private func updateButtonsState() {
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    private func resetButtonsState() {
        for button in buttons {
            button.isEnabled = true
            button.backgroundColor = UIColor.gray
        }
    }
    
    private func updateLivesLabel() {
        livesLabel.text = "♥️ \(remainingAttempts)"
    }
    
    private func addElements() {
        addSubview(imageBackGround)
        addSubview(titleLabel)
        addSubview(questionsLabel)
        addSubview(exerciseButtonLeft)
        addSubview(exerciseButtonMiddle)
        addSubview(exerciseButtonRight)
        addSubview(nextQuestionButton)
        addSubview(livesLabel)
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
            
            livesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            livesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
