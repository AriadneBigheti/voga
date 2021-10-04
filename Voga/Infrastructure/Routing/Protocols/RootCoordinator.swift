//
//  RootCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol RootCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController { get }
}

extension RootCoordinator {

    func show(viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
        presentingViewController.viewControllers = [viewController]
    }

    func updateStatusBarVisibility() {
        presentingViewController.isNavigationBarHidden = isNavigationBarHidden()
    }
}
