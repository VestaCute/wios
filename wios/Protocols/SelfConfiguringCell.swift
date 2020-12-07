//
//  SelfConfiguringCell.swift
//  wios
//
//  Created by Sasha Kondratjeva on 05.12.2020.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseid: String { get }
    func configure<U: Hashable>(with value: U)
}
