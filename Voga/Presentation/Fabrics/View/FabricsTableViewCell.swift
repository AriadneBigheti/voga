//
//  FabricsTableViewCell.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

import UIKit

class FabricsTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.backgroundWhite)

        return view
    }()

    private lazy var sustainabilityIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.clickableGreen)
        view.layer.cornerRadius = 6
        view.clipsToBounds = true

        return view
    }()

    private lazy var fabricName: UILabel = {
        let vogaLabel = VogaLabel(font: .AtkinsonRegular(size: 18))

        return vogaLabel
    }()

    private lazy var disclosureIndicator: UIImageView = {
        let image = UIImage(named: "disclosure-indicator")?.withTintColor(.appColor(.disclosureIndicator))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    func configure(with model: Fabric) {
        fabricName.text = model.material
        switch model.sustainabilityType {
        case .sustainable:
            sustainabilityIndicatorView.backgroundColor = .appColor(.sustainableIndicator)
        case .fairlySustainable:
            sustainabilityIndicatorView.backgroundColor = .yellow
        case .unsustainable:
            sustainabilityIndicatorView.backgroundColor = .appColor(.unsustainableIndicator)

        }
    }
}

extension FabricsTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(subview: containerView)
        containerView.addSubview(sustainabilityIndicatorView)
        containerView.addSubview(fabricName)
        containerView.addSubview(disclosureIndicator)
    }

    func setupConstraints() {

        containerView.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 58)]
        }

        sustainabilityIndicatorView.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             view.widthAnchor.constraint(equalToConstant: 12),
             view.heightAnchor.constraint(equalToConstant: 12)]
        }

        fabricName.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.leadingAnchor.constraint(equalTo: sustainabilityIndicatorView.trailingAnchor, constant: 16)]
        }

        disclosureIndicator.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
             view.widthAnchor.constraint(equalToConstant: 10),
             view.heightAnchor.constraint(equalToConstant: 15)]
        }
    }

    func additionalSetup() {
        backgroundColor = .appColor(.backgroundWhite)
    }
}
