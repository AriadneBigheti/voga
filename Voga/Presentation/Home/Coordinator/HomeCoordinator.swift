//
//  HomeCoordinator.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol HomeCoordinatorLogic: AnyObject {
    func showQuizScreen(for quiz: QuizType)
}

class HomeCoordinator: InTabBarCoordinator {
    var tabBarController: UITabBarController
    var item: UITabBarItem
    
    var presentingViewController: UINavigationController?
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    
    init(tabBarController: UITabBarController, item: UITabBarItem) {
        self.tabBarController = tabBarController
        self.item = item
    }
    
    func loadViewController() -> UIViewController {
        let presenter = HomePresenter(coordinatorDelegate: self)
        return HomeViewController(presenter: presenter)
    }
}

extension HomeCoordinator: HomeCoordinatorLogic {
    func showQuizScreen(for quiz: QuizType) {
        let coordinator = QuizCoordinator(presentingViewController: presentingViewController ?? UINavigationController(), quizType: quiz)
        coordinator.start()
        self.nextCoordinator = coordinator
    }
}
