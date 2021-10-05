//
//  FabricsCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

import UIKit

protocol FabricsCoordinatorLogic: AnyObject {
    func showFabricsDetails(fabric: Fabric)
}

class FabricsCoordinator: InTabBarCoordinator {
    var presentingViewController: UINavigationController?
    var tabBarController: UITabBarController
    var item: UITabBarItem
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?


    init(tabBarController: UITabBarController, item: UITabBarItem) {
        self.tabBarController = tabBarController
        self.item = item
    }

    func loadViewController() -> UIViewController {
        let presenter = FabricsPresenter(coordinatorDelegate: self)
        return FabricsViewController(presenter: presenter)
    }
}

extension FabricsCoordinator: FabricsCoordinatorLogic {
    func showFabricsDetails(fabric: Fabric) {
        let coordinator = FabricsDetailsCoordinator(presentingViewController: presentingViewController ?? UINavigationController(), fabric: fabric)
        coordinator.start()
        self.nextCoordinator = coordinator
    }
}
