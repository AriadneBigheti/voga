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
        containerView.isAccessibilityElement = true
        containerView.backgroundColor = .appColor(.backgroundWhite)
        containerView.layer.cornerRadius = 20

        return containerView
     }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit

        return image
    }()

    private lazy var title: VogaLabel = {
        let label = VogaLabel(font: .AtkinsonBold(size: 28))

        return label
    }()

    private lazy var subtitle: VogaLabel = {
        let label = VogaLabel(font: .AtkinsonRegular(size: 17))
        label.textColor = .appColor(.darkGrayFont)
        label.numberOfLines = 0
        
        return label
    }()

    func configure(with customizationTip: CustomizationTip) {
        title.text = customizationTip.category.capitalized
        subtitle.text = customizationTip.card.title
        //subtitle.configureSpacing(value: 0.41, for: .horizontal)
        //subtitle.configureSpacing(value: 5, for: .vertical)
        image.image = UIImage(named: customizationTip.card.image)
        containerView.accessibilityLabel = "\(title.text!), \(subtitle.text!)"
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
        containerView.addSubview(image)
        containerView.addSubview(title)
        containerView.addSubview(subtitle)
    }

    func setupConstraints() {
        containerView.constraint { view in
             [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
              view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)]
         }

        image.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
             view.widthAnchor.constraint(equalToConstant: 240),
             view.heightAnchor.constraint(equalToConstant: 230)]
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
        backgroundColor = .appColor(.background)
    }
}
