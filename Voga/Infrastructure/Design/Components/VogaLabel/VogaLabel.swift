//
//  VogaLabel.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 19/09/21.
//

import UIKit

final class VogaLabel: UILabel {
    
    init(text: String? = "", font: VogaFonts = VogaFonts.AtkinsonRegular(size: 14)) {
        super.init(frame: .zero)
        self.text = text
        self.font = font.uiFont
        self.textColor = .appColor(.black)
        self.numberOfLines = 0
    }
    
    func configureSpacing(value: CGFloat, for orientation: LabelSpacingOrientation) {
        guard let labelText = text else {
            return
        }
        
        switch orientation {
        case .horizontal:
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            self.attributedText = attributedString
        case .vertical:
            let attributedString = NSMutableAttributedString(string: labelText)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = value
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
