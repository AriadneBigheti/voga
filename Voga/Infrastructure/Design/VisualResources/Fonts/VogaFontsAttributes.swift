//
//  VogaFontsAttribute.swift
//  Voga
//
//  Created by Emilio Costa on 21/09/21.
//

import UIKit

enum VogaFontsAttribute {
    case AtkinsonRegular(size: CGFloat, color: VogaColors)
    case AtkinsonBold(size: CGFloat, color: VogaColors)
    case AtkinsonItalic(size: CGFloat, color: VogaColors)
    case AtkinsonItalicBold(size: CGFloat, color: VogaColors)

    var uiFontAttribute: [NSAttributedString.Key: Any] {
        switch self {
        case let .AtkinsonRegular(size, color):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Regular", size: size) else {
                return [ .font: UIFont.systemFont(ofSize: size, weight: .regular), .foregroundColor: color.uiColor ]
            }
            return [ .font: font, .foregroundColor: color.uiColor ]
        case let .AtkinsonBold(size, color):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Bold", size: size) else {
                return [ .font: UIFont.boldSystemFont(ofSize: size), .foregroundColor: color.uiColor ]
            }
            return [ .font: font, .foregroundColor: color.uiColor ]
        case let .AtkinsonItalic(size, color):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Italic", size: size) else {
                return [ .font: UIFont.italicSystemFont(ofSize: size), .foregroundColor: color.uiColor ]
            }
            return [ .font: font, .foregroundColor: color.uiColor ]
        case let .AtkinsonItalicBold(size, color):
            guard let font = UIFont(name: "AtkinsonHyperlegible-BoldItalic", size: size) else {
                return [ .font: UIFont.boldSystemFont(ofSize: size), .foregroundColor: color.uiColor ]
            }
            return [ .font: font, .foregroundColor: color.uiColor ]
        }
    }
}
