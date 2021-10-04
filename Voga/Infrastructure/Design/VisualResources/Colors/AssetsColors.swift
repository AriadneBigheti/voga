//
//  AssetsColors.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 23/09/21.
//

enum AssetsColor: String {
    case backgroundPink
    case backgroundWhite
    case lightPink
    case darkPink
    case clickableGreen
    case gray
    case subtitleGray
    case black
    case titleDarkPink
    case background
    case auxiliaryGreen
    case auxiliaryBlue
    case iconColor
    case sustainableIndicator
    case moderateSustainableIndicator
    case unsustainableIndicator
    case disclosureIndicator
    case darkGrayFont
    
    static func getFromString(colorName color: String) -> AssetsColor {
        if let color = AssetsColor(rawValue: color) {
            return color
        }

        return .black
    }
}
