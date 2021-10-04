//
//  QuizTableViewHeader.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 26/09/21.
//

import UIKit

class QuizTableViewHeader: UIView {
    init() {
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerLabel: UILabel = {
        let label = VogaLabel(text: "Testes", font: .AtkinsonBold(size: 24))
        label.textAlignment = .left
        
        return label
    }()
}

extension QuizTableViewHeader: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(headerLabel)
    }
    
    func setupConstraints() {
        headerLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .clear
    }
}
