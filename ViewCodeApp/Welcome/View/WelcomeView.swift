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
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    // MARK: - CodeView Methods
    func setupComponents() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .white
    }
    
    
}
