//
//  QuizCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol QuizCoordinatorLogic: AnyObject {
    func dismissViewController()
}

class QuizCoordinator: PresentedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    let quizType: QuizType
    
    init(presentingViewController: UINavigationController,  quizType: QuizType) {
        self.presentingViewController = presentingViewController
        self.quizType = quizType
    }
    
    func loadViewController() -> UIViewController {
        let presenter = QuizPresenter(coordinatorDelegate: self, quizType: quizType)
        let quizViewController = QuizViewController(presenter: presenter)
        quizViewController.modalPresentationStyle = .fullScreen
        return quizViewController
    }
}

extension QuizCoordinator: QuizCoordinatorLogic {
    func dismissViewController() {
        dismissViewController(animated: true)
    }
}

