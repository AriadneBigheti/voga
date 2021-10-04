//
//  ShowedCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol ShowedCoordinator: Coordinator {
    var currentViewController: UIViewController? { get set }
    func loadViewController() -> UIViewController
    func isNavigationBarHidden() -> Bool
    func isTabBarBarHidden() -> Bool
    func show(viewController: UIViewController, animated: Bool)
    func dismissViewController(animated: Bool)
}

extension ShowedCoordinator {
    func start(animated: Bool = true) {
        let viewController = loadViewController()
        viewController.hidesBottomBarWhenPushed = isTabBarBarHidden()
        
        show(viewController: viewController, animated: animated)
    }
    
    func dismissViewController(animated: Bool) {
        currentViewController?.dismiss(animated: animated)
    }
    
    func isNavigationBarHidden() -> Bool {
        return false
    }
    
    func isTabBarBarHidden() -> Bool {
           return false
    }
}
