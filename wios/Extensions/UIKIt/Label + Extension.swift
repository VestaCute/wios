//
//  StorageService.swift
//  wios
//
//  Created by Sasha Kondratjeva on 11.12.2020.
//


import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}

