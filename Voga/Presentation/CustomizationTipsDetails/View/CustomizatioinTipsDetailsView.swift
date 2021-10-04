//
//  CustomizationTipsDetailsView.swift
//  Voga
//
//  Created by Emilio Costa on 20/09/21.
//

import UIKit

class CustomizationTipsDetailsView: UIView {

    private weak var presenter: CustomizationTipsDetailsPresentationLogic?
    private var customizationTip: CustomizationTip
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray.withAlphaComponent(0.3)
        button.titleLabel?.font = VogaFonts.AtkinsonBold(size: 20).uiFont
        button.setTitle("X", for: .normal)
        button.setTitleColor(.darkGray.withAlphaComponent(0.5), for: .normal)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 530
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear

        tableView.register(ContentDetailsCell.self, forCellReuseIdentifier: "detailsCell")

        return tableView
    }()

    init(presenter: CustomizationTipsDetailsPresentationLogic, customizationTip: CustomizationTip) {
        self.presenter = presenter
        self.customizationTip = customizationTip
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var questionLabel: VogaLabel = {
        let label = VogaLabel()
        let assetColor = AssetsColor.getFromString(colorName: customizationTip.theme)
        label.attributedText = newStringStyle(customizationTip.details.subtitle, color: .appColor(assetColor))

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline

        return stackView
    }()
    
    @objc func didTapCloseButton() {
        presenter?.closeTipsScreen()
    }
}

extension CustomizationTipsDetailsView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(closeButton)
    }

    func setupConstraints() {
        closeButton.constraint { view in
            [view.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: 15),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
             view.heightAnchor.constraint(equalToConstant: 36),
             view.widthAnchor.constraint(equalToConstant: 36)]
        }
        
        tableView.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor),
              view.trailingAnchor.constraint(equalTo: trailingAnchor),
              view.topAnchor.constraint(equalTo: topAnchor),
              view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)]
        }
    }

    func additionalSetup() {
        backgroundColor = .appColor(.background)
    }
}

extension CustomizationTipsDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        customizationTip.details.tips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as? ContentDetailsCell else {
            return UITableViewCell()
        }

        cell.configure(with: customizationTip.details.tips[indexPath.row], isBackgroundGray: (indexPath.row % 2) == 0)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomizationTipsDetailsHeaderView()
        header.configure(with: customizationTip)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1000
    }
}

extension CustomizationTipsDetailsView: UITableViewDelegate {

}
