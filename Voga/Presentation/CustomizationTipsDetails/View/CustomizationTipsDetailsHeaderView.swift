//
//  CustomizationTipsDetailsHeaderView.swift
//  Voga
//
//  Created by Emilio Costa on 22/09/21.
//

import UIKit

class CustomizationTipsDetailsHeaderView: UIView {

    static var reuseIdentifier: String
        {
        get { return "headerDetailsCollectionView"}
    }

    private var customizationTip: CustomizationTip

    private lazy var containerView: UIView = {
        let container = UIView()

        return container
    }()

    private lazy var titleView: CustomizationTipsDetailsHeaderTitleView = {
        let view = CustomizationTipsDetailsHeaderTitleView()
        view.configure(with: customizationTip)

        return view
    }()

    private lazy var descriptionView: CustomizationTipsDetailsHeaderDescriptionView = {
        let view = CustomizationTipsDetailsHeaderDescriptionView()
        view.configure(with: customizationTip)

        return view
    }()

    func configure(with customizationTip: CustomizationTip) {
        titleView.configure(with: customizationTip)
        descriptionView.configure(with: customizationTip)
    }

    init() {
        self.customizationTip = CustomizationTip()
        super.init(frame: .zero)
        buildView()
    }

    override init(frame: CGRect) {
        self.customizationTip = CustomizationTip()
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomizationTipsDetailsHeaderView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        addSubviewWithConstraints(subview: containerView)
        containerView.addSubview(titleView)
        containerView.addSubview(descriptionView)
    }

    func setupConstraints() {
        titleView.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)]
        }

        descriptionView.constraint { view in
            [view.topAnchor.constraint(equalTo: titleView.bottomAnchor),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)]
        }
    }

    func additionalSetup() {
        backgroundColor = VogaColors.backgroundColor.uiColor
    }
}
