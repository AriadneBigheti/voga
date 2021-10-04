//
//  CustomizationTipsDetailsCoordinator.swift
//  Voga
//
//  Created by Emilio Costa on 20/09/21.
//

import UIKit

protocol CustomizationTipsDetailsCoordinatorLogic: AnyObject {

}

class CustomizationTipsDetailsCoordinator: PushedCoordinator, CustomizationTipsDetailsCoordinatorLogic {

    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    var customizationTip: CustomizationTip

    init(presentingViewController: UINavigationController, customizationTip: CustomizationTip) {
        self.presentingViewController = presentingViewController
        self.customizationTip = customizationTip
    }

    func loadViewController() -> UIViewController {
        let presenter = CustomizationTipsDetailsPresenter(coordinatorDelegate: self)
        return CustomizationTipsDetailsViewController(presenter: presenter, customizationTip: customizationTip)
    }

}
