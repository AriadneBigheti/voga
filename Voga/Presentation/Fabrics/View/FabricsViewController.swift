//
//  FabricsViewController.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

import UIKit

class FabricsViewController: UIViewController {
    private let contentView: FabricsView
    private let presenter: FabricsPresentationLogic

    init(presenter: FabricsPresentationLogic) {
        self.presenter = presenter
        self.contentView = FabricsView(presenter: presenter)
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
        presenter.loadData()
    }


    func setupNavigation() {
        navigationItem.searchController = buildSearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.isNavigationBarHidden = false
    }

    private func buildSearchController() -> UISearchController {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Buscar"

        return search
    }
}

extension FabricsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.search(text: searchController.searchBar.text ?? "")
    }
}
