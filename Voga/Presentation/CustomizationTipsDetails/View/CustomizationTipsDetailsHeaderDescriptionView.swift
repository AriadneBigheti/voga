//
//  CustomizationTipsDetailsDescriptionView.swift
//  Voga
//
//  Created by Ariadne Bigheti on 21/09/21.
//

import UIKit

class CustomizationTipsDetailsHeaderDescriptionView: UIView {

    init() {
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
     }()

    private lazy var imageBackground: UIView = {
        let imageBackground = UIView()
        imageBackground.backgroundColor = .white
        imageBackground.layer.masksToBounds = true
        return imageBackground
     }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 17).uiFont
        label.numberOfLines = 5
        return label
    }()

    private lazy var descriptionImage: UIImageView = {
        let rectangle = UIImageView()
        rectangle.contentMode = .scaleAspectFit
        return rectangle
    }()

    func configure(with customizationTip: CustomizationTip) {
        titleLabel.attributedText = newStringStyle(customizationTip.details.subtitle, color: VogaColors.getFromString(colorName: customizationTip.theme))
        descriptionLabel.text = customizationTip.details.description
        descriptionImage.image = UIImage(named: customizationTip.details.descriptionImage)
    }

}

extension CustomizationTipsDetailsHeaderDescriptionView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: containerView)
        containerView.addSubview(imageBackground)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(descriptionImage)
    }

    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 48.5),
             view.widthAnchor.constraint(equalToConstant: 206),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)]
        }

        descriptionLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)]
        }

        imageBackground.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.heightAnchor.constraint(equalToConstant: 490)]
        }

        descriptionImage.constraint{ view in
            [view.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
             view.bottomAnchor.constraint(equalTo: imageBackground.bottomAnchor, constant: -20)]
        }
    }

    func additionalSetup() {
        backgroundColor = .white
    }
}
