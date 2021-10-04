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

    private lazy var title: VogaLabel = {
        let label = VogaLabel(text: "Dicas",font: .AtkinsonBold(size: 34))
        return label
    }()

    private lazy var subtitle: VogaLabel = {
        let label = VogaLabel(
            text: "Saiba como customizar suas peças, aumentando seu tempo de vida e assim sendo mais sustentável.", font: .AtkinsonRegular(size: 15))
        label.textColor = .appColor(.darkGrayFont)
        label.configureSpacing(value: 0.9, for: .horizontal) //nao funciona pois a linha de baixo sobrescreveu essa
        label.configureSpacing(value: 4, for: .vertical)

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
    
    private lazy var groupedElement: UIAccessibilityElement = {
        let group = UIAccessibilityElement(accessibilityContainer: self)
        group.accessibilityLabel = "\(title.text!), \(subtitle.text!)"
        group.accessibilityFrameInContainerSpace = title.frame.union(subtitle.frame)
        
        return group
    }()
    
    private lazy var elements: [UIAccessibilityElement] = {
        var list = [UIAccessibilityElement]()
        list.append(groupedElement)
        return list
    }()
    
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
        backgroundColor = .appColor(.background)
    }
}
