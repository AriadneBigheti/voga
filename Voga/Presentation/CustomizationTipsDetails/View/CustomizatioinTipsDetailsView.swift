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

    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.attributedText = newStringStyle(customizationTip.details.subtitle, color: VogaColors.getFromString(colorName: customizationTip.theme))

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline

        return stackView
    }()

}

extension CustomizationTipsDetailsView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor),
              view.trailingAnchor.constraint(equalTo: trailingAnchor),
              view.topAnchor.constraint(equalTo: topAnchor, constant: 0),
              view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)]
        }
    }

    func additionalSetup() {
        backgroundColor = VogaColors.backgroundColor.uiColor
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
