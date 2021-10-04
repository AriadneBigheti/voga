//
//  CustomizationTipsDetailsPresenter.swift
//  Voga
//
//  Created by Emilio Costa on 20/09/21.
//

import Foundation

protocol CustomizationTipsDetailsPresentationLogic: AnyObject {
    func closeTipsScreen()
}

class CustomizationTipsDetailsPresenter: CustomizationTipsDetailsPresentationLogic {
    private weak var coordinator: CustomizationTipsDetailsCoordinatorLogic?

    init(coordinatorDelegate: CustomizationTipsDetailsCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
    }
    
    func closeTipsScreen() {
        coordinator?.dismissViewController()
    }
}
