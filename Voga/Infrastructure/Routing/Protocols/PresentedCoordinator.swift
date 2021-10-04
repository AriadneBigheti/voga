//
//  PresentedCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 25/09/21.
//

import UIKit

protocol PresentedCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController { get }
}

extension PresentedCoordinator {
    func show(viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
        presentingViewController.present(viewController, animated: animated)
    }
}
