//
//  CustomizationTipsPresenter.swift
//  Voga
//
//  Created by Pedro Haruke Leme da Rocha Rinzo on 15/09/21.
//

protocol CustomizationTipsPresentationLogic: AnyObject {
    func getCustomizationTips() -> [CustomizationTip]
    func showCustomizationTipsDetail(customizationTip: CustomizationTip)
}

class CustomizationTipsPresenter: CustomizationTipsPresentationLogic {

    private var tips: [CustomizationTip]?

    private weak var coordinator: CustomizationTipsCoordinatorLogic?

    init(coordinatorDelegate: CustomizationTipsCoordinatorLogic) {
        self.coordinator = coordinatorDelegate
        self.tips = customizationTips;
    }

    func getCustomizationTips() -> [CustomizationTip] {
        return self.tips!
    }

    func showCustomizationTipsDetail(customizationTip: CustomizationTip) {
        coordinator?.showCustomizationTipsDetail(customizationTip: customizationTip)
    }
}
