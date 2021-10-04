//
//  QuizViewController.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

class QuizViewController: UIViewController {
    private let contentView: QuizView
    private let presenter: QuizPresentationLogic
    
    init(presenter: QuizPresentationLogic) {
        self.presenter = presenter
        self.contentView = QuizView(presenter: presenter, quizType: presenter.quizType)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    func setupNavigation() {
        
    }
}
