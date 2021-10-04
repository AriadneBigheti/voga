//
//  HeaderCollectionView.swift
//  Voga
//
//  Created by Emilio Costa on 17/09/21.
//

import UIKit

class HeaderCollectionView: UICollectionReusableView {

    static var reuseIdentifier: String
        {
        get { return "headerCollectionView"}
    }

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonBold(size: 34).uiFont
        label.text = "Dicas"

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 14).uiFont
        label.textColor = VogaColors.gray.uiColor
        label.text = "Saiba como customizar suas peças, aumentando o tempo de vida delas e assim sendo mais sustentável."
        label.numberOfLines = 0

        return label
    }()

    init() {
        super.init(frame: .zero)
        buildView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderCollectionView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(title)
        addSubview(subtitle)
    }

    func setupConstraints() {
        title.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 10),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)]
        }

        subtitle.constraint { view in
            [view.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)]
        }
    }

    func additionalSetup() {
        backgroundColor = VogaColors.backgroundColor.uiColor
    }
}
