//
//  FabricsDetailsPresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 05/10/21.
//


protocol FabricsDetailsPresentationLogic: AnyObject {
    var fabric: Fabric { get }
}

class FabricsDetailsPresenter: FabricsDetailsPresentationLogic {
    private weak var coordinator: FabricsDetailsCoordinatorLogic?
    var fabric: Fabric

    init(coordinatorDelegate: FabricsDetailsCoordinatorLogic, fabric: Fabric) {
        self.fabric = fabric
        self.coordinator = coordinatorDelegate
    }
}

