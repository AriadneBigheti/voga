//
//  PushedCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol PushedCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController { get }
}

extension PushedCoordinator {
    func show(viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
        presentingViewController.pushViewController(viewController, animated: animated)
    }
}
