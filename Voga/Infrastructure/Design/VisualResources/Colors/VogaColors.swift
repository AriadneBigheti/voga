//
//  VogaColors.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 12/09/21.
//

import UIKit

enum VogaColors: String {
    case clickableGreen
    case lightGreen
    case mediumGreen
    case darkPink
    case lightPink
    case lightGray
    case gray
    case backgroundColor
    case darkBlue
    case lightBlue
    case whiteOppacity

    case fallback

    var uiColor: UIColor {
        switch self {
            case .clickableGreen:
                return UIColor(red: 0, green: 0.384, blue: 0.122, alpha: 1)
            case .lightGreen:
                return UIColor(red: 0.578, green: 0.758, blue: 0.636, alpha: 1)
            case .mediumGreen:
                return UIColor(red: 0.471, green: 0.749, blue: 0.561, alpha: 1)
            case .darkPink:
                return UIColor(red: 0.812, green: 0.271, blue: 0.349, alpha: 1)
            case .lightPink:
                return UIColor(red: 0.933, green: 0.607, blue: 0.655, alpha: 1)
            case .lightGray:
                return UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            case .gray:
                return UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
            case .backgroundColor:
                return UIColor(red: 0.949, green: 0.949, blue: 0.965, alpha: 1)
            case .darkBlue:
                return UIColor(red: 0.004, green: 0.316, blue: 0.492, alpha: 1)
            case .lightBlue:
                return UIColor(red: 0.508, green: 0.823, blue: 1, alpha: 1)
            case .whiteOppacity:
                return UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
            default:
                return UIColor.black
        }
    }

    static func getFromString(colorName color: String) -> VogaColors {
        if let vogaColor = VogaColors(rawValue: color) {
            return vogaColor
        }

        return .fallback
    }
}

//
//class VogaColors {
//    static let clickableGreen = UIColor(red: 0, green: 0.384, blue: 0.122, alpha: 1)
//    static let lightGreen = UIColor(red: 0.578, green: 0.758, blue: 0.636, alpha: 1)
//    static let mediumGreen = UIColor(red: 0.471, green: 0.749, blue: 0.561, alpha: 1)
//    static let darkPink = UIColor(red: 0.812, green: 0.271, blue: 0.349, alpha: 1)
//    static let lightPink = UIColor(red: 0.933, green: 0.607, blue: 0.655, alpha: 1)
//    static let reallyLightPink = UIColor(r: 255, g: 226, b: 231)
//    static let backgroundPink = UIColor(r: 255, g: 244, b: 246)
//    static let gray = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
//    static let backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.965, alpha: 1)
//    static let darkBlue = UIColor(red: 0.004, green: 0.316, blue: 0.492, alpha: 1)
//    static let lightBlue = UIColor(red: 0.508, green: 0.823, blue: 1, alpha: 1)
//    static let lightGray = UIColor(red: 0.679, green: 0.676, blue: 0.676, alpha: 1)
//}
