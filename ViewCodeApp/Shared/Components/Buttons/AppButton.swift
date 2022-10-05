//
//  AppButton.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import UIKit

class AppButton: UIButton {

    enum Style {
        case main, secondary
    }
    
    private var style: Style = .main
    private var text: String = ""
    
    init(style: Style, text: String) {
        self.style = style
        self.text = text
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let titleColor: UIColor
        let bgColor: UIColor
        
        switch style {
        case .main:
            titleColor = .MAIN_BUTTON_TEXT
            bgColor = .MAIN_BUTTON
        case .secondary:
            titleColor = .SECONDARY_BUTTON_TEXT
            bgColor = .SECONDARY_BUTTON
            layer.borderWidth = 2
            layer.borderColor = UIColor.SECONDARY_BUTTON_BORDER.cgColor
        }
        
        
        setTitle(text, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = 25
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
