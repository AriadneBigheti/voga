//
//  NegativeFeedbackCardView.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 20/09/21.
//

import UIKit

class QuizFeedbackCardView: UIView {

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
        containerView.isAccessibilityElement = true
        
        return containerView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let containerView = UIStackView()
        containerView.backgroundColor = .clear
        containerView.axis = .vertical
        containerView.distribution = .equalCentering
        
        return containerView
    }()
    
    private lazy var titleLabelsContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        return containerView
    }()
    
    private lazy var testTitleLabel: VogaLabel = {
        let label = VogaLabel(font: .AtkinsonRegular(size: 14))
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .appColor(.subtitleGray)
        
        return label
    }()
    
    private lazy var feedbackTitleLabel: VogaLabel = {
        let label = VogaLabel(text: "Não foi dessa vez...", font: .AtkinsonBold(size: 22))
        label.textAlignment = .left
        label.textColor = UIColor.appColor(.titleDarkPink)
        
        return label
    }()
    
    private lazy var feedbackTextLabel: VogaLabel = {
        let label = VogaLabel(text: "Essa peça vai ficar encalhada no seu guarda roupa se você comprar ela, porque ela não combina com as suas outras peças.", font: .AtkinsonRegular(size: 18))
        label.configureSpacing(value: 8, for: .vertical)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .appColor(.black)
        
        return label
    }()
    
    private var illustrativeImage: UIImageView = {
        let imageView = UIImageView(image: .init(named: "shopping-bag"))
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    func configure(with model: QuizFeedbackCardViewModel, title: String) {
        testTitleLabel.text = title
        feedbackTitleLabel.text = model.quizFeedback
        feedbackTextLabel.text = model.quizFeedbackExplanation
        illustrativeImage.image = UIImage(named: model.quizFeedbackImage)
        containerView.accessibilityLabel = "\(feedbackTitleLabel.text!). \(feedbackTextLabel.text!)"
    }
    
    func setColors(_ color: UIColor) {
        feedbackTitleLabel.textColor = color
    }
}

extension QuizFeedbackCardView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: containerView)
        containerView.addSubviewWithConstraints(subview: containerStackView, top: 40, bottom: -40)
        containerStackView.addArrangedSubview(titleLabelsContainerView)
        titleLabelsContainerView.addSubview(testTitleLabel)
        titleLabelsContainerView.addSubview(feedbackTitleLabel)
        containerStackView.addArrangedSubview(illustrativeImage)
        containerStackView.addArrangedSubview(feedbackTextLabel)
        
    }
    
    func setupConstraints() {
        testTitleLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30)]
        }
        
        feedbackTitleLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: testTitleLabel.leadingAnchor),
             view.topAnchor.constraint(equalTo: testTitleLabel.bottomAnchor, constant: 4)]
        }
        
        illustrativeImage.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.widthAnchor.constraint(equalToConstant: 230),
             view.heightAnchor.constraint(equalToConstant: 140)]
        }
        
        feedbackTextLabel.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.leadingAnchor.constraint(equalTo: testTitleLabel.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            ]
        }
    }
}
