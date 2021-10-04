//
//  TipCard.swift
//  Voga
//
//  Created by Emilio Costa on 16/09/21.
//

import UIKit

class TipCardCell: UICollectionViewCell {

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 40

        return containerView
     }()

    private lazy var imageBackground: UIView = {
        let imageBackground = UIView()
        imageBackground.layer.cornerRadius = 85
        imageBackground.layer.masksToBounds = true

        return imageBackground
     }()

    private lazy var image: UIImageView = {
        let image = UIImageView()

        return image
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonBold(size: 28).uiFont

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 17).uiFont
        label.textColor = VogaColors.gray.uiColor
        label.numberOfLines = 0

        return label
    }()

    func configure(with customizationTip: CustomizationTip) {
        title.text = customizationTip.category.capitalized
        subtitle.text = customizationTip.card.title
        image.image = UIImage(named: customizationTip.card.image)
        imageBackground.backgroundColor = VogaColors.getFromString(colorName: customizationTip.secondaryTheme).uiColor
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TipCardCell: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(imageBackground)
        containerView.addSubview(image)
        containerView.addSubview(title)
        containerView.addSubview(subtitle)
    }

    func setupConstraints() {
        containerView.constraint { view in
             [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
              view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)]
         }

        imageBackground.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
             view.widthAnchor.constraint(equalToConstant: 170),
             view.heightAnchor.constraint(equalToConstant: 170)]
        }

        image.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.topAnchor.constraint(equalTo: imageBackground.topAnchor),
             view.widthAnchor.constraint(equalToConstant: 160),
             view.heightAnchor.constraint(equalToConstant: 204)]
        }

        title.constraint { view in
            [view.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
             view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 22)]
        }

        subtitle.constraint { view in
            [view.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
             view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 22),
             view.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -22),
             view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30)]
        }
    }

    func additionalSetup() {
        backgroundColor = VogaColors.backgroundColor.uiColor
    }
}
