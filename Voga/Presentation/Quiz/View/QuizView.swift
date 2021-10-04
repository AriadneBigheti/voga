//
//  QuizView.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

class QuizView: UIView {
    
    private weak var presenter: QuizPresentationLogic?
    private let quizType: QuizType
    private var index: Int = 0
    
    init(presenter: QuizPresentationLogic, quizType: QuizType) {
        self.presenter = presenter
        self.quizType = quizType
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Fechar", for: .normal)
        button.setTitleColor(.appColor(.clickableGreen), for: .normal)
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.appColor(.clickableGreen)
        progressView.backgroundColor = UIColor.appColor(.gray)
        progressView.layer.cornerRadius = 4
        
        return progressView
    }()
    
    private lazy var questionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(QuizCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private func didSelectPositiveAction(cell: QuizCollectionViewCell) {
        guard index+1 == quizType.questions.count else {
            scrollItemInCollectionView()
            updateProgressBar()
            return
        }
        updateProgressBar()
        cell.configureFeedbackCardView(with: quizType.positiveFeedbackModel, title: quizType.quizTitle)
        cell.showFeedbackCardAnimated(for: .positiveResult)
        
        UIView.transition(with: progressBar, duration: 0.7, options: .transitionCrossDissolve) {
            self.progressBar.progressTintColor = .appColor(.auxiliaryGreen)
        }
    }
    
    private func didSelectNegativeAction(cell: QuizCollectionViewCell) {
        cell.configureFeedbackCardView(with: quizType.negativeFeedbackModel, title: quizType.quizTitle)
        cell.showFeedbackCardAnimated(for: .negativeResult)

        UIView.transition(with: progressBar, duration: 0.7, options: .transitionCrossDissolve) {
            self.progressBar.progressTintColor = .appColor(.darkPink)
        }
    }
    
    private func scrollItemInCollectionView() {
        index += 1
        questionsCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    private func updateProgressBar() {
        let progressValue = Float(1.0/Float(quizType.questions.count))
        if progressBar.progress == 0 {
            progressBar.setProgress(progressValue, animated: true)
            return
        }
        progressBar.setProgress(progressBar.progress + progressValue, animated: true)
    }
    
    @objc func dismissScreen() {
        presenter?.dismiss()
    }
}

extension QuizView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(dismissButton)
        addSubview(progressBar)
        addSubview(questionsCollectionView)
    }
    
    func setupConstraints() {
        dismissButton.constraint { view in
            [view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
             view.topAnchor.constraint(equalTo: safeArea().topAnchor),
             view.heightAnchor.constraint(equalToConstant: 42),
             view.widthAnchor.constraint(equalToConstant: 67)]
        }
        
        progressBar.constraint { view in
            [view.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: 80),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
             view.heightAnchor.constraint(equalToConstant: 5)]
        }
        
        questionsCollectionView.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
             view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: -80)
            ]
        }
    }
    
    func additionalSetup() {
        backgroundColor = UIColor.appColor(.backgroundPink)
    }
}

extension QuizView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 60.0, bottom: 0.0, right: 60.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = collectionView.frame.width - 80 - 25
        
        return CGSize(width: widthPerItem, height: collectionView.frame.height - 60)
    }
    
    
}

extension QuizView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        quizType.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? QuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        let questionViewModel = QuizCollectionViewCellModel(
            question: quizType.questions[indexPath.row],
            quizTitle: quizType.quizTitle,
            actions: ({
                self.didSelectNegativeAction(cell: cell)
            }, {
                self.didSelectPositiveAction(cell: cell)
            })
        )
        cell.configure(with: questionViewModel)
        return cell
    }
}
