//
//  CodeView.swift
//  ViewCodeApp
//
//  Created by Matheus Lopes on 04/10/22.
//

import Foundation

protocol CodeView {
    func setup()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfigurations()
}

extension CodeView {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfigurations()
    }
}
