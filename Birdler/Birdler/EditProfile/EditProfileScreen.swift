//
//  EditProfileScreen.swift
//  Birdler
//
//  Created by Pedro Ribeiro on 04/07/2024.
//
//
//import UIKit
//
//class EditProfileScreen: UIView {

//
//  RegisterScreen.swift
//  Birdler
//
//  Created by Vitor Ernane Guedes on 14/05/24.
//

import UIKit

protocol EditProfileScreenProtocol: AnyObject {
    func tappedCadastrarButton()
    func tappedProfileImageButton()
}

class EditProfileScreen: UIView {
    
    private weak var delegate: EditProfileScreenProtocol?
    
    public func delegate(delegate: EditProfileScreenProtocol?) {
        self.delegate = delegate
        
    }
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        
        return imageView
        
    }()
    
    func getGradientLayer(bounds : CGRect) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor(red: 0.47, green: 0.05, blue: 0.98, alpha: 1).cgColor, UIColor(red: 0.99, green: 0.55, blue: 0.22, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        return gradient
        
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
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
    
    let profileImageViewWidth:CGFloat = 100
    
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
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
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
    
    lazy var lineView: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "___________________________________________________"
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var iconEmail: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RegisterEmailIcon")
        
        return image
        
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Email"
        label.textColor = .black
        
        return label
        
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.attributedPlaceholder = NSAttributedString(string: "ex: maria@gmail.com", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = false
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.masksToBounds = false
        textField.autocapitalizationType = .none
        textField.textColor = .darkGray
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var lineViewEmail: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "___________________________________________________"
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var iconPassword: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RegisterpadLockIcon")
        
        return image
        
    }()
    
    lazy var passwordlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Digite sua senha"
        label.textColor = .black
        
        return label
        
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.attributedPlaceholder = NSAttributedString(string: "•••••••••••", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.masksToBounds = false
        textField.autocapitalizationType = .none
        textField.textColor = .darkGray
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var lineViewPassword: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "___________________________________________________"
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var iconPasswordAgain: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RegisterpadLockIcon")
        
        return image
    }()
    
    lazy var passwordAgainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Digite sua senha novamente"
        label.textColor = .black
        return label
        
    }()
    
    lazy var passwordAgainTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.frame = CGRect(x: 0, y: 0, width: 331, height: 125)
        textField.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2).cgColor
        textField.keyboardType = .alphabet
        textField.attributedPlaceholder = NSAttributedString(string: "•••••••••••", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.font = UIFont.boldSystemFont(ofSize: 15)
        textField.layer.masksToBounds = false
        textField.textColor = .darkGray
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 28))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        return textField
        
    }()
    
    lazy var lineViewPasswordAgain: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "___________________________________________________"
        label.textColor = .lightGray
        return label
        
    }()
    
    lazy var cadastrarButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.urbanistFont(type: .bold, size: 19)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.addTarget(self, action: #selector(tappedCadastrarButton), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func tappedProfileImageButton(_ sender: UIButton) {
        delegate?.tappedProfileImageButton()
        print("Add Photo Profile")
        
    }
    
    @objc func tappedCadastrarButton(_ sender: UIButton) {
        print("Criou a conta")
        let _: HomeVC = HomeVC()
        delegate?.tappedCadastrarButton()
        
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
        
        
        viewRegister.addSubview(iconUser)
        viewRegister.addSubview(userLabel)
        viewRegister.addSubview(userTextField)
        viewRegister.addSubview(lineView)
        
        viewRegister.addSubview(iconEmail)
        viewRegister.addSubview(emailLabel)
        viewRegister.addSubview(emailTextField)
        viewRegister.addSubview(lineViewEmail)
        
        viewRegister.addSubview(iconPassword)
        viewRegister.addSubview(passwordlLabel)
        viewRegister.addSubview(passwordTextField)
        viewRegister.addSubview(lineViewPassword)
        
        viewRegister.addSubview(iconPasswordAgain)
        viewRegister.addSubview(passwordAgainLabel)
        viewRegister.addSubview(passwordAgainTextField)
        viewRegister.addSubview(lineViewPasswordAgain)
        
        viewRegister.addSubview(cadastrarButton)
        
        DispatchQueue.main.async {
            
            let gradient = self.getGradientLayer(bounds: self.logoLabel.bounds)
            self.logoLabel.textColor = self.gradientColor(bounds: self.logoLabel.bounds, gradientLayer: gradient)
            
        }
        
        DispatchQueue.main.async {
            let gradient = self.getGradientLayer(bounds: self.cadastrarButton.bounds)
            self.cadastrarButton.backgroundColor = self.gradientColor(bounds: self.cadastrarButton.bounds, gradientLayer: gradient)
            
        }
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            viewRegister.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 28),
            viewRegister.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewRegister.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewRegister.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconUser.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 12),
            iconUser.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 45),
            
            userLabel.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 12),
            userLabel.leadingAnchor.constraint(equalTo: iconUser.leadingAnchor, constant: 35),
            
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            userTextField.leadingAnchor.constraint(equalTo: iconUser.leadingAnchor, constant: 35),
            
            lineView.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant:3),
            lineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            lineView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            iconEmail.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 25),
            iconEmail.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 49),
            
            emailLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: iconEmail.leadingAnchor, constant: 35),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: iconEmail.leadingAnchor, constant: 35),
            
            lineViewEmail.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant:3),
            lineViewEmail.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            lineViewEmail.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            iconPassword.topAnchor.constraint(equalTo: lineViewEmail.bottomAnchor, constant: 17),
            iconPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 51),
            
            passwordlLabel.topAnchor.constraint(equalTo: lineViewEmail.bottomAnchor, constant: 10),
            passwordlLabel.leadingAnchor.constraint(equalTo: iconPassword.leadingAnchor, constant: 35),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordlLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: iconPassword.leadingAnchor, constant: 35),
            
            lineViewPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant:3),
            lineViewPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            lineViewPassword.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            iconPasswordAgain.topAnchor.constraint(equalTo: lineViewPassword.bottomAnchor, constant: 17),
            iconPasswordAgain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 51),
            
            passwordAgainLabel.topAnchor.constraint(equalTo: lineViewPassword.bottomAnchor, constant: 10),
            passwordAgainLabel.leadingAnchor.constraint(equalTo: iconPasswordAgain.leadingAnchor, constant: 35),
            
            passwordAgainTextField.topAnchor.constraint(equalTo: passwordAgainLabel.bottomAnchor, constant: 5),
            passwordAgainTextField.leadingAnchor.constraint(equalTo: iconPasswordAgain.leadingAnchor, constant: 35),
            
            lineViewPasswordAgain.topAnchor.constraint(equalTo: passwordAgainTextField.bottomAnchor, constant:3),
            lineViewPasswordAgain.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            lineViewPasswordAgain.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            cadastrarButton.topAnchor.constraint(equalTo: lineViewPasswordAgain.bottomAnchor, constant: 20),
            cadastrarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
            cadastrarButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -35),
            cadastrarButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
}