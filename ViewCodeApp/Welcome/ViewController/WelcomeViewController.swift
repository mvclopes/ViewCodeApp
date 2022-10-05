//
//  WelcomeViewController.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func loadView() {
        view = WelcomeView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonClicked(with phone: String) {
        print("O usuário apertou botão de login e colocou o telefone: \(phone)")
    }
    
    func signUpButtonClicked() {
        print("O usuário apertou botão de sign up")
    }
    
    func googleButtonClicked() {
        
    }
    
    func facebookButtonClicked() {
        
    }
    
    
}
