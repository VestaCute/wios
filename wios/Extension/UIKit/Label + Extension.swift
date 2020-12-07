//
//  Label + Extension.swift
//  wios
//
//  Created by Sasha Kondratjeva on 01.12.2020.
//

import UIKit

extension UILabel {
    
    convenience init(text:String, font: UIFont? = .SFPro20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
