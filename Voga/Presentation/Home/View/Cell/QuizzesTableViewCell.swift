//
//  QuizzesTableViewCell.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 26/09/21.
//

import UIKit

class QuizzesTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var quizType: QuizType?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .appColor(.backgroundWhite)
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var quizIllustrativeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var quizTitle: UILabel = {
        let vogaLabel = VogaLabel(font: .AtkinsonBold(size: 18))
        
        return vogaLabel
    }()
    
    private lazy var quizDescription: UILabel = {
        let vogaLabel = VogaLabel(font: .AtkinsonRegular(size: 14))
        
        return vogaLabel
    }()
    
    func configure(with model: Quiz) {
        quizTitle.text = model.quizTitle
        quizIllustrativeImage.image = UIImage(named: model.quizImage)
        quizDescription.text = model.quizDescription
        quizType = model.quizType
    }
}

extension QuizzesTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(subview: containerView, leading: 0, trailing: 0, top: 6, bottom: -6)
        containerView.addSubview(quizIllustrativeImage)
        containerView.addSubview(quizTitle)
        containerView.addSubview(quizDescription)
    }
    
    func setupConstraints() {
        
        containerView.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 120)]
        }
        
        quizIllustrativeImage.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
             view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
             view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
             view.widthAnchor.constraint(equalToConstant: 100),
             view.heightAnchor.constraint(equalToConstant: 100)]
        }
        
        quizTitle.constraint { view in
            [view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
             view.leadingAnchor.constraint(equalTo: quizIllustrativeImage.trailingAnchor, constant: 18),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)]
        }
        
        quizDescription.constraint { view in
            [view.topAnchor.constraint(equalTo: quizTitle.bottomAnchor, constant: 4),
             view.leadingAnchor.constraint(equalTo: quizTitle.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .clear
    }
}
