//
//  TabbarCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

class TabbarCoordinator: RootCoordinator {

    var nextCoordinator: Coordinator?
    var coordinators: [Coordinator] = []

    var currentViewController: UIViewController?
    var presentingViewController: UINavigationController
    var tabbarController: UITabBarController

    init(presentingViewController: UINavigationController) {
        self.tabbarController = TabbarController()
        self.presentingViewController = presentingViewController
    }

    func loadViewController() -> UIViewController {
        self.coordinators = configureTabBar()
        return tabbarController
    }

    func configureTabBar() -> [Coordinator] {
        let homeCoordinator = TabbarItems.createMainScreenTabItem(tabbarController)
        let customizationTipCoordinator = TabbarItems.createCustomizationTipTabIcon(tabbarController)
        let fabricsCoordinator = TabbarItems.createFabricsTabItem(tabbarController)
        UITabBar.appearance().tintColor = .appColor(.clickableGreen)

        return [homeCoordinator, customizationTipCoordinator, fabricsCoordinator]
    }

    func toUpdateIsNavigationBarHidden() -> Bool? {
        return true
    }
}
