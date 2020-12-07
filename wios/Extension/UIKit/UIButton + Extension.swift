//
//  UIButton + Extension.swift
//  wios
//
//  Created by Sasha Kondratjeva on 01.12.2020.
//

import Foundation
import UIKit
import SwiftUI

extension UIButton {
    convenience init (title: String,
                      titleColor:UIColor,
                      backgroundColor: UIColor,
                      font: UIFont? = .SFPro20(),
                      isShadow: Bool = false,
                      cornerRarius: CGFloat = 4) {
        self.init(type: .system)
        
        self.setTitle (title, for: .normal)
        self.setTitleColor (titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRarius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 2, height: 4)
        }
    }
    
    func costomizedGoogleButtom() {
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
