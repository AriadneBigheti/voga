//
//  TabbarItems.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 13/09/21.
//

import UIKit

enum TabbarItems: Int {
    case home
    case customizationTips
    case fabrics
    case maps

    static let imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)

    static func createMainScreenTabItem(_ tabbarController: UITabBarController) -> HomeCoordinator {
        let image = UIImage(named: "home-icon")
        let selectedImage = image?.withTintColor((.appColor(.clickableGreen) ?? VogaColors.clickableGreen.uiColor))
        let itemTitle = "Explorar"
        let homeItem = UITabBarItem(title: itemTitle, image: image, selectedImage: selectedImage)
        homeItem.imageInsets = TabbarItems.imageInsets
        let homeCoordinator = HomeCoordinator(tabBarController: tabbarController,
                                              item: homeItem)
        homeCoordinator.start()
        
        return homeCoordinator
    }
    
    static func createCustomizationTipTabIcon(_ tabbarController: UITabBarController) -> CustomizationTipsCoordinator {
        let image = UIImage(named: "customization-tips-icon")
        let selectedImage = image?.withTintColor((.appColor(.clickableGreen) ?? VogaColors.clickableGreen.uiColor))
        let itemTitle = "Dicas"
        let tipsItem = UITabBarItem(title: itemTitle, image: image, selectedImage: selectedImage)
        tipsItem.imageInsets = TabbarItems.imageInsets
        let customizationTipsCoordinator = CustomizationTipsCoordinator(tabBarController: tabbarController,
                                              item: tipsItem)
        customizationTipsCoordinator.start()

        return customizationTipsCoordinator
    }
    
    static func createFabricsTabItem(_ tabbarController: UITabBarController) -> FabricsCoordinator {
        let image = UIImage(named: "home-icon")?.withTintColor((.appColor(.iconColor) ?? VogaColors.gray.uiColor))
        let selectedImage = image?.withTintColor((.appColor(.clickableGreen) ?? VogaColors.clickableGreen.uiColor))
        let itemTitle = "Tecidos"
        let fabricsItem = UITabBarItem(title: itemTitle, image: image, selectedImage: selectedImage)
        fabricsItem.imageInsets = TabbarItems.imageInsets

        let fabricsCoordinator = FabricsCoordinator(tabBarController: tabbarController, item: fabricsItem)
        fabricsCoordinator.start()

        return fabricsCoordinator
    }
}
