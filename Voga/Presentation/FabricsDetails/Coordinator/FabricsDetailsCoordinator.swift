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
    var fabric: Fabric
    
    init(presentingViewController: UINavigationController, fabric: Fabric) {
        self.presentingViewController = presentingViewController
        self.fabric = fabric
    }

    func loadViewController() -> UIViewController {
        let presenter = FabricsDetailsPresenter(coordinatorDelegate: self, fabric: fabric)
        return FabricsDetailsViewController(presenter: presenter)
    }
}

extension FabricsDetailsCoordinator: FabricsDetailsCoordinatorLogic {

}
