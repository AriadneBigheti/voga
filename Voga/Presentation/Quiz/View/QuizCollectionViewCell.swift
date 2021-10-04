//
//  QuizCollectionViewCell.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 14/09/21.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    private var actions: (negativeAction: () -> Void, positiveAction: () -> Void) = ({}, {})
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.appColor(.backgroundWhite)
        containerView.layer.cornerRadius = 40
        
        return containerView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let containerView = UIStackView()
        containerView.backgroundColor = .clear
        containerView.axis = .vertical
        containerView.distribution = .fill
        containerView.spacing = 35
        
        return containerView
    }()
    
    private lazy var testTitleLabel: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 16).uiFont
        label.textAlignment = .center
        label.textColor = .appColor(.subtitleGray)
        
        return label
    }()
    
    private lazy var questionTextLabel: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 16).uiFont
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = VogaFonts.AtkinsonRegular(size: 16).uiFont
        label.textAlignment = .center
        label.textColor = .appColor(.black)
        
        return label
    }()
    
    private lazy var illustrativeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var positiveResponseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.clickableGreen)
        button.layer.cornerRadius = 14
        button.setTitleColor(.appColor(.backgroundWhite), for: .normal)
        
        return button
    }()
    
    private lazy var negativeResponseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor(.darkPink)
        button.layer.cornerRadius = 14
        button.setTitleColor(.appColor(.backgroundWhite), for: .normal)
        
        return button
    }()
    
    private lazy var feedbackView: QuizFeedbackCardView = {
        let view = QuizFeedbackCardView()
        
        return view
    }()
    
    private lazy var buttonContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    private lazy var spacingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    func configure(with questionModel: QuizCollectionViewCellModel) {
        positiveResponseButton.setTitle(questionModel.question.positiveResponseOption, for: .normal)
        negativeResponseButton.setTitle(questionModel.question.negativeResponseOption, for: .normal)
        illustrativeImage.image = UIImage(named: questionModel.question.illustrativeContentImage)
        questionTextLabel.text = questionModel.question.text
        questionLabel.text = questionModel.question.question
        testTitleLabel.text = questionModel.quizTitle
        actions.negativeAction = questionModel.actions.negativeAction
        actions.positiveAction = questionModel.actions.positiveAction
        positiveResponseButton.addTarget(self, action: #selector(didTapPositiveButton), for: .touchUpInside)
        negativeResponseButton.addTarget(self, action: #selector(didTapNegativeButton), for: .touchUpInside)
    }
    
    func configureFeedbackCardView(with model: QuizFeedbackCardViewModel, title: String){
        feedbackView.configure(with: model, title: title)
    }
    
    @objc private func didTapNegativeButton() {
        actions.negativeAction()
    }
    
    @objc private func didTapPositiveButton() {
        actions.positiveAction()
    }
    
    func showFeedbackCardAnimated(for result: QuizResult) {
        switch result {
        case .positiveResult:
            feedbackView.setColors(.black)
            UIView.transition(from: containerView, to: feedbackView, duration: 0.7, options: .transitionFlipFromRight)
        case .negativeResult:
            UIView.transition(from: containerView, to: feedbackView, duration: 0.7, options: .transitionFlipFromLeft)
        }
    }
}

extension QuizCollectionViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(feedbackView)
        addSubview(containerView)
        containerView.addSubviewWithConstraints(subview: containerStackView, top: 20, bottom: -20)
        
        containerStackView.addArrangedSubview(testTitleLabel)
        containerStackView.addArrangedSubview(illustrativeImage)
        containerStackView.addArrangedSubview(questionTextLabel)
        containerStackView.addArrangedSubview(questionLabel)
        containerStackView.addArrangedSubview(buttonContainer)
        
        buttonContainer.addSubview(positiveResponseButton)
        buttonContainer.addSubview(negativeResponseButton)
    }
    
    func setupConstraints() {
        containerView.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor)]
        }
        
        testTitleLabel.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
           ]
        }
        
        feedbackView.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor)]
        }
        
        questionTextLabel.constraint { view in
            [
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38)]
        }

        illustrativeImage.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.widthAnchor.constraint(equalToConstant: 250),
             view.heightAnchor.constraint(equalToConstant: 180)]
        }

        questionLabel.constraint { view in
            [
                view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)]
        }
        
        buttonContainer.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.heightAnchor.constraint(equalTo: positiveResponseButton.heightAnchor)]
        }
        
        positiveResponseButton.constraint { view in
            [view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38),
             view.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 17),
             view.heightAnchor.constraint(equalToConstant: 32)]
        }
        
        negativeResponseButton.constraint { view in
            [view.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -17),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
             view.heightAnchor.constraint(equalToConstant: 32)]
        }
    }
}
