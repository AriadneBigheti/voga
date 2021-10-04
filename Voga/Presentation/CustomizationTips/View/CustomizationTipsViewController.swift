//
//  CustomizationTipsViewController.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 15/09/21.
//

import UIKit

class CustomizationTipsViewController: UIViewController {
    private let contentView: CustomizationTipsView
    private let presenter: CustomizationTipsPresentationLogic

    init(presenter: CustomizationTipsPresentationLogic) {
        self.presenter = presenter
        self.contentView = CustomizationTipsView(presenter: presenter)
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
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
}
