//
//  ContentDetailsCell.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 23/09/21.
//

import Foundation
import UIKit

class ContentDetailsCell: UITableViewCell {

    var didRenderSteps: Bool = false
    
    var tip: Tip = Tip()

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .appColor(.backgroundWhite)

        return containerView
    }()

    private lazy var title: VogaLabel = {
        let label = VogaLabel(font: .AtkinsonBold(size: 24))

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = VogaLabel(font: .AtkinsonRegular(size: 17))

        return label
    }()

    private lazy var cloujureLabel: VogaLabel = {
        let label = VogaLabel(font: .AtkinsonRegular(size: 17))

        return label
    }()

    private lazy var stepStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 15

        return stackView
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()

        return image
    }()

    func configure(with tip: Tip, isBackgroundGray: Bool) {
        self.tip = tip
        title.text = tip.title
        subtitle.text = tip.description
        image.image = UIImage(named: tip.image)
        cloujureLabel.text = tip.cloujure
        containerView.backgroundColor = isBackgroundGray ? .appColor(.background) : .appColor(.backgroundWhite)
        setupStackView(with: tip.steps)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContentDetailsCell: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: containerView)
        containerView.addSubview(title)
        containerView.addSubview(subtitle)
        containerView.addSubview(cloujureLabel)
        containerView.addSubview(image)
        containerView.addSubview(stepStackView)
    }

    func setupStackView(with steps: [String]) {
        guard didRenderSteps == false else {
            return
        }

        for i in 0...steps.count-1 {
            let stepView = StepView()
            stepView.configure(with: .init(numberOfSteps: i+1, descriptionSteps: steps[i]), color: AssetsColor.getFromString(colorName: tip.theme))
            stepView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            stepStackView.addArrangedSubview(stepView)
        }
        didRenderSteps = true
    }

    func setupConstraints() {
        title.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)]
        }

        subtitle.constraint { view in
            [view.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 14),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22)]
        }

        image.constraint { view in
            [view.topAnchor.constraint(equalTo: cloujureLabel.bottomAnchor, constant: 14),
             view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -37),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)]
        }

        cloujureLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: stepStackView.bottomAnchor, constant: 14),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 22)]
        }
        stepStackView.constraint { view in
            [view.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 14),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14)]
        }
    }
}
