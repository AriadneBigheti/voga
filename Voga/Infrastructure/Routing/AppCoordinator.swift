//
//  AppCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?
    var presentingViewController: UINavigationController

    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }

    func start(animated: Bool) {
        let coordinator = TabbarCoordinator(presentingViewController: presentingViewController)
        coordinator.start()
        nextCoordinator = coordinator
    }
}

