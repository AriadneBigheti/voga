//
//  CustomizationTipsDetailsViewController.swift
//  Voga
//
//  Created by Emilio Costa on 20/09/21.
//

import UIKit

class CustomizationTipsDetailsViewController: UIViewController {
    private let contentView: CustomizationTipsDetailsView
    private let presenter: CustomizationTipsDetailsPresentationLogic
    private let customizationTip: CustomizationTip

    init(presenter: CustomizationTipsDetailsPresentationLogic, customizationTip: CustomizationTip) {
        self.presenter = presenter
        self.customizationTip = customizationTip
        self.contentView = CustomizationTipsDetailsView(presenter: presenter, customizationTip: customizationTip)
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
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.isNavigationBarHidden = false
    }
}
