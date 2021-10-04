//
//  ViewCodeProtocol.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 12/09/21.
//

import Foundation

protocol ViewCodeProtocol {
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()

    func buildView()
}

extension ViewCodeProtocol {
    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() { }
}
