//
//  AppStyle.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import Foundation
import UIKit

extension CGFloat {
    static let HORIZONTAL: CGFloat = 24
    static let HORIZONTAL_SMALL: CGFloat = 10
    static let VERTICAL: CGFloat = 16
    static let VERTICAL_SMALL: CGFloat = 16
    static let VERTICAL_LARGE: CGFloat = 32
    static let VERTICAL_EXTRA_LARGE: CGFloat = 48
}

extension UIFont {
    static let TITLE = UIFont.boldSystemFont(ofSize: 28)
    static let BODY = UIFont.systemFont(ofSize: 16)
    static let BUTTON = UIFont.systemFont(ofSize: 16)
}


extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static let MAIN_BLACK = UIColor(r: 20, g: 20, b: 20)
    static let MEDIUM_GRAY = UIColor(r: 124, g: 124, b: 124)
    static let BASE_PURPLE = UIColor(r: 97, g: 97, b: 255)
    static let ULTRA_LIGHT_GRAY = UIColor(r: 251, g: 251, b: 251)
    
    static let TITLE = MAIN_BLACK
    static let BODY = MEDIUM_GRAY
    static let MAIN_BUTTON = BASE_PURPLE
    static let MAIN_BUTTON_TEXT = white
    static let SECONDARY_BUTTON = white
    static let SECONDARY_BUTTON_TEXT = MAIN_BLACK
    static let SECONDARY_BUTTON_BORDER = MAIN_BLACK
    static let VIEW = ULTRA_LIGHT_GRAY
}
