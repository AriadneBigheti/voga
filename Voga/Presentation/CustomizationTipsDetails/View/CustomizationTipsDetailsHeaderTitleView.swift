//
//  CustomizationTipsDetailsHeaderTitleView.swift
//  Voga
//
//  Created by Emilio Costa on 22/09/21.
//

import UIKit

class CustomizationTipsDetailsHeaderTitleView: UIView {

    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.clipsToBounds = true
        return containerView
     }()

    private lazy var imageBackground: UIView = {
        let imageBackground = UIView()
        imageBackground.layer.cornerRadius = 200
        imageBackground.layer.masksToBounds = true
        imageBackground.backgroundColor = VogaColors.whiteOppacity.uiColor

        return imageBackground
     }()

    private lazy var image: UIImageView = {
        let image = UIImageView()

        return image
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 16).uiFont
        label.textColor = VogaColors.lightGray.uiColor

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonBold(size: 30).uiFont
        label.numberOfLines = 0

        return label
    }()

    func configure(with customizationTip: CustomizationTip) {
        title.text = customizationTip.category.uppercased()
        subtitle.text = customizationTip.details.title
        image.image = UIImage(named: customizationTip.details.titleImage)
        containerView.backgroundColor = VogaColors.getFromString(colorName: customizationTip.secondaryTheme).uiColor
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomizationTipsDetailsHeaderTitleView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(imageBackground)
        containerView.addSubview(image)
        containerView.addSubview(title)
        containerView.addSubview(subtitle)
    }

    func setupConstraints() {
        containerView.constraint { view in
             [view.topAnchor.constraint(equalTo: topAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor),
              view.trailingAnchor.constraint(equalTo: trailingAnchor),
              view.bottomAnchor.constraint(equalTo: bottomAnchor)]
         }

        title.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
             view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 22)]
        }

        subtitle.constraint { view in
            [view.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
             view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 22),
             view.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -22),
             view.bottomAnchor.constraint(equalTo: imageBackground.topAnchor, constant: -16)]
        }

        imageBackground.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.topAnchor.constraint(equalTo: subtitle.bottomAnchor),
             view.widthAnchor.constraint(equalToConstant: 400),
             view.heightAnchor.constraint(equalToConstant: 400)]
        }

        image.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.topAnchor.constraint(equalTo: imageBackground.topAnchor),
             view.widthAnchor.constraint(equalToConstant: 310),
             view.heightAnchor.constraint(equalToConstant: 356),
             view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)]
        }
    }
}
