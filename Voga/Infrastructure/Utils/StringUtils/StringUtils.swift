//
//  StringUtils.swift
//  Voga
//
//  Created by Emilio Costa on 21/09/21.
//

import Foundation

func newStringStyle(_ stringFromJson: String, color: VogaColors) -> NSMutableAttributedString {
    let newString = NSMutableAttributedString()
    var isColored: Bool = false
    for char in stringFromJson {
        if (char == "<" || char == ">") {
            isColored = char == "<"
        } else {
            newString.append(NSAttributedString(string: String(char), attributes:
                                                    isColored ? VogaFontsAttribute.AtkinsonBold(size: 24, color: color).uiFontAttribute : VogaFontsAttribute.AtkinsonBold(size: 24, color: .fallback).uiFontAttribute))
        }
    }
    
    return newString
}
