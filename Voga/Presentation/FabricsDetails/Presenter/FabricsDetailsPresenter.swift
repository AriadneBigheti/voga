//
//  FabricsDetailsPresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 05/10/21.
//


protocol FabricsDetailsPresentationLogic: AnyObject {

}

class FabricsDetailsPresenter: FabricsDetailsPresentationLogic {
    private weak var coordinator: FabricsDetailsCoordinatorLogic?

    init(coordinatorDelegate: FabricsDetailsCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
    }
}

