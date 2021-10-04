//
//  UIView+Extension.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 03/09/21.
//

import UIKit

extension UIView {
    func addSubviewWithConstraints(subview: UIView, leading: CGFloat = 0.0, trailing: CGFloat = 0.0,
                                   top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        self.addSubview(subview)
        subview.constraint { view in
            [
                view.leadingAnchor.constraint(equalTo: safeArea().leadingAnchor, constant: leading),
                view.trailingAnchor.constraint(equalTo: safeArea().trailingAnchor, constant: trailing),
                view.topAnchor.constraint(equalTo: safeArea().topAnchor, constant: top),
                view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: bottom)
            ]
        }
    }

    func addSubviewWithConstraintsOnViewGuide(subview: UIView,
                                              leading: CGFloat = 0.0, trailing: CGFloat = 0.0,
                                              top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        self.addSubview(subview)
        subview.constraint { view in
            [
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailing),
                view.topAnchor.constraint(equalTo: topAnchor, constant: top),
                view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom)
            ]
        }
    }

    func safeArea() -> UILayoutGuide {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }
}

extension UIView {
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
    }
}
