//
//  FabricsView.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

import UIKit

protocol FabricsViewDelegate: AnyObject {
    func updateView(with fabrics: [Fabric])
}

class FabricsView: UIView {
    private weak var presenter: FabricsPresentationLogic?
    private var fabrics: [Fabric] = []

    init(presenter: FabricsPresentationLogic) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.presenter?.viewDelegate = self
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var fabricsTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(FabricsTableViewCell.self, forCellReuseIdentifier: "fabricCell")

        return tableView
    }()

}

extension FabricsView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(fabricsTableView)
    }

    func setupConstraints() {
        fabricsTableView.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor)]
        }
    }

    func additionalSetup() {
        backgroundColor = .appColor(.background)
    }
}

extension FabricsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fabrics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fabricCell", for: indexPath) as? FabricsTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(with: fabrics[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Confira os impactos ambientais de cada tecido."
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showFabricsDetails()
    }
}

extension FabricsView: FabricsViewDelegate {
    func updateView(with fabrics: [Fabric]) {
        self.fabrics = fabrics
        fabricsTableView.reloadData()
    }
}
