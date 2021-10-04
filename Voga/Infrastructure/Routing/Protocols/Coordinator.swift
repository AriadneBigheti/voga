//
//  Coordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var nextCoordinator: Coordinator? { get set}
    var currentViewController: UIViewController? { get }
    func start()
    func start(animated: Bool)
}

extension Coordinator {
    func start() {
        start(animated: true)
    }
}
