//
//  VogaFonts.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 12/09/21.
//

import UIKit

enum VogaFonts {
    case AtkinsonRegular(size: CGFloat)
    case AtkinsonBold(size: CGFloat)
    case AtkinsonItalic(size: CGFloat)
    case AtkinsonItalicBold(size: CGFloat)
    
    var uiFont: UIFont {
        switch self {
        case let .AtkinsonRegular(size):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Regular", size: size) else {
                return UIFont.systemFont(ofSize: size, weight: .regular)
            }
            return font
        case let .AtkinsonBold(size):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Bold", size: size) else {
                return UIFont.boldSystemFont(ofSize: size)
            }
            return font
        case let .AtkinsonItalic(size):
            guard let font = UIFont(name: "AtkinsonHyperlegible-Italic", size: size) else {
                return UIFont.italicSystemFont(ofSize: size)
            }
            return font
        case let .AtkinsonItalicBold(size):
            guard let font = UIFont(name: "AtkinsonHyperlegible-BoldItalic", size: size) else {
                return UIFont.boldSystemFont(ofSize: size)
            }
            return font
        }
    }
}

//Family: Atkinson Hyperlegible Font names: ["AtkinsonHyperlegible-Regular", "AtkinsonHyperlegible-Italic", "AtkinsonHyperlegible-Bold", "AtkinsonHyperlegible-BoldItalic"]
