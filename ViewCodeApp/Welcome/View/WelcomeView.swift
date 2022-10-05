//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonClicked(with phone: String)
    func signUpButtonClicked()
    func googleButtonClicked()
    func facebookButtonClicked()
}

class WelcomeView: UIView, CodeView {
    
    // MARK: - Properties
    weak var delegate: WelcomeViewDelegate?

    // MARK: - Initializers
    init(delegate: WelcomeViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Components
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .onDrag
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = .welcome
        label.numberOfLines = 1
        label.font = .TITLE
        label.textColor = .TITLE
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = .main
        label.numberOfLines = 0
        label.font = .BODY
        label.textColor = .BODY
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var socialMediaLabel: UILabel = {
        let label = UILabel()
        label.text = .socialMedia
        label.numberOfLines = 0
        label.font = .BODY
        label.textColor = .BODY
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = .phone
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = .HORIZONTAL_SMALL
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var loginButton = AppButton(style: .main, text: .login)
    lazy var signUpButton = AppButton(style: .secondary, text: .signup)
    
    // MARK: - CodeView Methods
    func setupComponents() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(buttonsStackView)
        contentView.addSubview(socialMediaLabel)
        // Arranjando componentes dentro da pilha (StackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(signUpButton)
    }
    
    func setupConstraints() {
        // Imagem
        // VFL (Visual Format Language)
        // NSLayoutGuide
        //LayoutAnchor -> último e mais utilizado
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: .VERTICAL_EXTRA_LARGE),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .HORIZONTAL),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.HORIZONTAL),
            mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        // Labels
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: .VERTICAL).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .HORIZONTAL).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.HORIZONTAL).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .VERTICAL_SMALL).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        // TextField
        phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: .VERTICAL_LARGE).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor).isActive = true
        
        buttonsStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: .VERTICAL_LARGE).isActive = true
        buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor, multiplier: 1).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor, multiplier: 1).isActive = true
        
        socialMediaLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.VERTICAL_LARGE).isActive = true
        socialMediaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .HORIZONTAL).isActive = true
        socialMediaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.HORIZONTAL).isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .white
        loginButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        switch sender {
        case loginButton:
            delegate?.loginButtonClicked(with: phoneTextField.text!)
        case signUpButton:
            delegate?.signUpButtonClicked()
        default:
            break
        }
        
    }
    
}
