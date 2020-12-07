//
//  SegmentedControll + Extension.swift
//  wios
//
//  Created by Sasha Kondratjeva on 03.12.2020.
//

import UIKit

extension UISegmentedControl {
    convenience init(first: String, second: String, other: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.insertSegment(withTitle: other, at: 2, animated: true)
        self.selectedSegmentIndex = 2
    }
}
