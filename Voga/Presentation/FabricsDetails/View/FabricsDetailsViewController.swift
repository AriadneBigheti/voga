//
//  FabricsDetailsViewController.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 05/10/21.
//

import UIKit

class FabricsDetailsViewController: UIViewController {
    private let contentView: FabricsDetailsView
    private let presenter: FabricsDetailsPresentationLogic

    init(presenter: FabricsDetailsPresentationLogic) {
        self.presenter = presenter
        self.contentView = FabricsDetailsView(presenter: presenter)
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
        navigationController?.isNavigationBarHidden = false
    }
}

