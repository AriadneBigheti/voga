//
//  ViewController.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    private let contentView: HomeView
    private let presenter: HomePresentationLogic
    
    init(presenter: HomePresentationLogic) {
        self.presenter = presenter
        self.contentView = HomeView(presenter: presenter)
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
        navigationController?.isNavigationBarHidden = true
    }
}
