//
//  QuestionCollectionViewCelllViewModel.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 16/09/21.
//

struct QuizCollectionViewCellModel {
    var question: Question
    var quizTitle: String
    var actions: (negativeAction: () -> (), positiveAction: () -> ())
}
