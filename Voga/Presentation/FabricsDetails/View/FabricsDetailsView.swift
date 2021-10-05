//
//  FabricsDetailsView.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 05/10/21.
//

import UIKit

class FabricsDetailsView: UIView {
    private weak var presenter: FabricsDetailsPresentationLogic?
    private var fabric: Fabric

    init(presenter: FabricsDetailsPresentationLogic) {
        self.presenter = presenter
        self.fabric = presenter.fabric
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FabricsDetailsView: ViewCodeProtocol {
    func setupHierarchy() {
    
    }

    func setupConstraints() {
        
    }

    func additionalSetup() {
        backgroundColor = .appColor(.background)
    }
}
