//
//  UIColor+Extensions.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 03/09/21.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    return UIColor(named: name.rawValue) ?? .black
  }
}
