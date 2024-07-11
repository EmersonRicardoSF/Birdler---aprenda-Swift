import UIKit

protocol EditProfileScreenProtocol: AnyObject {
    func EditProfileNavigation()
    func DeleteAccountNavigation()
}

class EditProfileScreen: UIView {
    
    private weak var delegate: EditProfileScreenProtocol?
    
    public func delegate(delegate: EditProfileScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func getGradientLayer(bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            UIColor(red: 0x15/255.0, green: 0x75/255.0, blue: 0xF6/255.0, alpha: 1.0).cgColor,  // Azul Xcode (posição 10%)
            UIColor(red: 0x6A/255.0, green: 0x0D/255.0, blue: 0xAD/255.0, alpha: 1.0).cgColor,  // Roxo (posição 37%)
            UIColor(red: 0x5A/255.0, green: 0x0D/255.0, blue: 0xAE/255.0, alpha: 1.0).cgColor,  // Subton de Roxo (posição 58%)
            UIColor(red: 0xF0/255.0, green: 0x51/255.0, blue: 0x38/255.0, alpha: 1.0).cgColor   // Swift Orange (posição 87%)
        ]
        gradient.locations = [
            NSNumber(value: 0.10),  // Posição 10%
            NSNumber(value: 0.37),  // Posição 37%
            NSNumber(value: 0.58),  // Posição 58%
            NSNumber(value: 0.87)   // Posição 87%
        ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradient
    }
    
    func gradientColor(bounds: CGRect, gradientLayer: CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image!)
    }
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.text = "Birdler"
        return label
    }()
    
    lazy var viewRegister: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 28
        return view
    }()
    
    let profileImageViewWidth: CGFloat = 100
    
    lazy var iconUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RegisterUserIcon")
        return image
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Nome"
        label.textColor = .black
        return label
    }()
    
    lazy var alertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.urbanistFont(type: .bold, size: 16)
        label.textAlignment = .center
        label.text = "Ao clicar em salvar alterações, retorne a Home e seus dados estarão atualizados."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .lightGray
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.attributedPlaceholder = NSAttributedString(string: "ex: Maria José", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = false
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.masksToBounds = false
        textField.textColor = .darkGray
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    
    
    lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar alterações", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedEditProfileButton), for: .touchUpInside)
        return button
    }()
    
    lazy var deleteAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Deletar conta", for: .normal)
        button.setTitleColor(.white.withAlphaComponent(0.5), for: .normal)
        button.tintColor = .white.withAlphaComponent(0.5)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 16)
        button.backgroundColor = .clear
        button.isHidden = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedDeleteAccountButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedDeleteAccountButton(_ sender: UIButton) {
        delegate?.DeleteAccountNavigation()
    }
    
    @objc func tappedEditProfileButton(_ sender: UIButton) {
        delegate?.EditProfileNavigation()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(backgroundImageView)
        addSubview(logoLabel)
        addSubview(viewRegister)
        addSubview(deleteAccountButton)
        addSubview(alertLabel)
        
        
        viewRegister.addSubview(iconUser)
        viewRegister.addSubview(userLabel)
        viewRegister.addSubview(userTextField)
        
        
        viewRegister.addSubview(editProfileButton)
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.logoLabel.bounds)
            self.logoLabel.textColor = self.gradientColor(bounds: self.logoLabel.bounds, gradientLayer: gradient)
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.editProfileButton.bounds)
            self.editProfileButton.backgroundColor = self.gradientColor(bounds: self.editProfileButton.bounds, gradientLayer: gradient)
        }
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            viewRegister.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 140),
            viewRegister.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewRegister.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewRegister.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconUser.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 32),
            iconUser.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            userLabel.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 32),
            userLabel.leadingAnchor.constraint(equalTo: iconUser.leadingAnchor, constant: 35),
            
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            userTextField.leadingAnchor.constraint(equalTo: iconUser.leadingAnchor, constant: 35),
            
            editProfileButton.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 40),
            editProfileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            editProfileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            editProfileButton.heightAnchor.constraint(equalToConstant: 45),
            
            deleteAccountButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            deleteAccountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            alertLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 80),
            alertLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            alertLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            
        ])
    }
    
}
