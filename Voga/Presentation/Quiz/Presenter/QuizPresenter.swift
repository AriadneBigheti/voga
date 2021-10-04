//
//  QuizPresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

protocol QuizPresentationLogic: AnyObject {
    func dismiss()
    var quizType: QuizType { get }
}

class QuizPresenter: QuizPresentationLogic {
    private weak var coordinator: QuizCoordinatorLogic?
    let quizType: QuizType
    
    init(coordinatorDelegate: QuizCoordinatorLogic, quizType: QuizType) {
        self.coordinator = coordinatorDelegate
        self.quizType = quizType
    }
    
    func dismiss() {
        coordinator?.dismissViewController()
    }
}
