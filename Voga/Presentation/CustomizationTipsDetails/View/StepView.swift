//
//  StepsDetailsCell.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 28/09/21.
//

import UIKit
import SwiftUI

class StepView: UIView {

    init() {
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var numberOfStep: UILabel = {
        let vogaLabel = UILabel()
        vogaLabel.font = VogaFonts.AtkinsonBold(size: 50).uiFont
        vogaLabel.numberOfLines = 0
        vogaLabel.text = "1."
        vogaLabel.textColor = .systemPink

        return vogaLabel
    }()

    private lazy var descriptionStep: UILabel = {
        let vogaLabel = UILabel()
        vogaLabel.font = VogaFonts.AtkinsonRegular(size: 17).uiFont
        vogaLabel.numberOfLines = 0
        vogaLabel.text = ""

        return vogaLabel
    }()

    func configure(with model: Step) {
        numberOfStep.text = "\(model.numberOfSteps)."
        descriptionStep.text = model.descriptionSteps
    }
}
extension StepView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(numberOfStep)
        addSubview(descriptionStep)
    }

    func setupConstraints() {
        numberOfStep.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.topAnchor.constraint(equalTo: topAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor),
             view.widthAnchor.constraint(equalToConstant: 60)]
        }
        descriptionStep.constraint { view in
             [view.leadingAnchor.constraint(equalTo: numberOfStep.trailingAnchor, constant: 14),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.centerYAnchor.constraint(equalTo: numberOfStep.centerYAnchor),
             view.widthAnchor.constraint(equalToConstant: 280)]
        }
    }


}
