//
//  WelcomeViewController.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var customView: WelcomeView {
        view as! WelcomeView
    }
    
    override func loadView() {
        view = WelcomeView(delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            guard let userInfo = notification.userInfo,
                  let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
            
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let animation = UIView.AnimationOptions(rawValue: userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt)
            
            UIView.animate(withDuration: duration, delay: 0.0, options: animation, animations: {
                self.customView.scrollView.contentInset.bottom = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
                self.customView.scrollView.verticalScrollIndicatorInsets.bottom = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
            }) { (success) in
                print("Teclado terminou de aparecer")
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            customView.scrollView.contentInset.bottom = 0
            customView.scrollView.verticalScrollIndicatorInsets.bottom = 0
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
