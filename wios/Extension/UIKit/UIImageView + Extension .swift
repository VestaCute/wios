//
//  UIImageView + Extension .swift
//  wios
//
//  Created by Sasha Kondratjeva on 01.12.2020.
//

import UIKit

extension UIImageView {
    convenience init(image:UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
