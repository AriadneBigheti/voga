//
//  HomeView.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

protocol HomeViewDelegate {
    func updateView(with quizzes: [Quiz])
}

class HomeView: UIView {
    private weak var presenter: HomePresentationLogic?
    
    let quizzes: [Quiz]
    
    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        self.quizzes = presenter.retrieveQuizes()
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var quizzesTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.estimatedRowHeight = 110
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        
        tableView.register(QuizzesTableViewCell.self, forCellReuseIdentifier: "quizCell")
        
        return tableView
    }()
}

extension HomeView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(quizzesTableView)
    }
    
    func setupConstraints() {
        quizzesTableView.constraint { view in
            [view.topAnchor.constraint(equalTo: centerYAnchor, constant: -50),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
             view.bottomAnchor.constraint(equalTo: bottomAnchor)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .appColor(.background)
    }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showQuizScreen(for: quizzes[indexPath.row].quizType)
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizzes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as? QuizzesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: quizzes[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return QuizTableViewHeader()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
