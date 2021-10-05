//
//  FabricsDetailsCoordinator.swift.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 05/10/21.
//

import UIKit

protocol FabricsDetailsCoordinatorLogic: AnyObject {

}

class FabricsDetailsCoordinator: PushedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }

    func loadViewController() -> UIViewController {
        let presenter = FabricsDetailsPresenter(coordinatorDelegate: self)
        return FabricsDetailsViewController(presenter: presenter)
    }
}

extension FabricsDetailsCoordinator: FabricsDetailsCoordinatorLogic {

}
