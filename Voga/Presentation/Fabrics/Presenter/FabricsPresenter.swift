//
//  FabricsPresenter.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

protocol FabricsPresentationLogic: AnyObject {
    func loadData()
    func search(text: String)
    func showFabricsDetails()
    var viewDelegate: FabricsViewDelegate? { get set }
}

class FabricsPresenter: FabricsPresentationLogic {
    private weak var coordinator: FabricsCoordinatorLogic?
    weak var viewDelegate: FabricsViewDelegate?

    init(coordinatorDelegate: FabricsCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
    }
    
    func showFabricsDetails() {
        coordinator?.showFabricsDetails()
    }

    func loadData() {
        viewDelegate?.updateView(with: retrieveFabrics())
    }

    func search(text: String) {
        let fabrics = text == "" ?  retrieveFabrics() : retrieveFabrics().filter { $0.material.uppercased().contains(text.uppercased()) }
        viewDelegate?.updateView(with: fabrics)
    }

    func retrieveFabrics() -> [Fabric] {
        return [
            .init(
                material: "Algodão",
                sustainabilityType: .sustainable
            ),
            .init(
                material: "Couro",
                sustainabilityType: .unsustainable
            ),
            .init(
                material: "Poliéster",
                sustainabilityType: .unsustainable
            )
        ]
    }
}
