//
//  FabricsPresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

protocol FabricsPresentationLogic: AnyObject {
    func loadData()
    func search(text: String)
    func showFabricsDetails(fabric: Fabric)
    var viewDelegate: FabricsViewDelegate? { get set }
}

class FabricsPresenter: FabricsPresentationLogic {
    private weak var coordinator: FabricsCoordinatorLogic?
    weak var viewDelegate: FabricsViewDelegate?

    init(coordinatorDelegate: FabricsCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
    }
    
    func showFabricsDetails(fabric: Fabric) {
        coordinator?.showFabricsDetails(fabric: fabric)
    }

    func loadData() {
        viewDelegate?.updateView(with: retrieveFabrics())
    }

    func search(text: String) {
        let fabrics = text == "" ?  retrieveFabrics() : retrieveFabrics().filter { $0.title.uppercased().contains(text.uppercased()) }
        viewDelegate?.updateView(with: fabrics)
    }

    func retrieveFabrics() -> [Fabric] {
        return fabrics
    }
}
