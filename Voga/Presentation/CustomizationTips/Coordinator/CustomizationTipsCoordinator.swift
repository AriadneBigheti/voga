//
//  CustomizationTipsCoordinator.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 15/09/21.
//

import UIKit

protocol CustomizationTipsCoordinatorLogic: AnyObject {
    func showCustomizationTipsDetail(customizationTip: CustomizationTip)
}

class CustomizationTipsCoordinator: InTabBarCoordinator {

    var tabBarController: UITabBarController
    var item: UITabBarItem

    var presentingViewController: UINavigationController?
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?

    init(tabBarController: UITabBarController, item: UITabBarItem) {
        self.tabBarController = tabBarController
        self.item = item
    }

    func loadViewController() -> UIViewController {
        let presenter = CustomizationTipsPresenter(coordinatorDelegate: self)
        return CustomizationTipsViewController(presenter: presenter)
    }

}

extension CustomizationTipsCoordinator: CustomizationTipsCoordinatorLogic {
    func showCustomizationTipsDetail(customizationTip: CustomizationTip) {
        let coordinator = CustomizationTipsDetailsCoordinator(presentingViewController: presentingViewController ?? UINavigationController(), customizationTip: customizationTip)
        coordinator.start()
        self.nextCoordinator = coordinator
    }
}
