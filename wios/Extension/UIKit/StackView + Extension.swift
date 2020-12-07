//
//  StackView + Extension.swift
//  wios
//
//  Created by Sasha Kondratjeva on 01.12.2020.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init (arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
