//
//  HomePresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

protocol HomePresentationLogic: AnyObject {
    func showQuizScreen(for quiz: QuizType)
    func retrieveQuizes() -> [Quiz]
}

class HomePresenter: HomePresentationLogic {
    private weak var coordinator: HomeCoordinatorLogic?
    
    init(coordinatorDelegate: HomeCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
    }
    
    func showQuizScreen(for quiz: QuizType) {
        coordinator?.showQuizScreen(for: quiz)
    }
    
    func retrieveQuizes() -> [Quiz] {
        return [
            .init(
                quizImage: "three-looks-rule-first-question",
                quizTitle: "Regra dos três looks",
                quizDescription: "Faça um teste para refletir se você precisa mesmo comprar essa roupa",
                quizType: .threeLooksRule
            ),
            .init(
                quizImage: "five-questions-first-image",
                quizTitle: "As 5 questões",
                quizDescription: "Descubra se você vai realmente usar a roupa que pretende comprar",
                quizType: .fiveReasons
            ),
            .init(
                quizImage: "detachment-test-first-image",
                quizTitle: "Desapega!",
                quizDescription: "Descubra se está ou não na hora de desapegar daquela roupa",
                quizType: .detachmentTest)
        ]
    }
}
