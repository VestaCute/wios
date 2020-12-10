//
//  Validators.swift
//  wios
//
//  Created by Sasha Kondratjeva on 10.12.2020.
//

import Foundation

class Validators {
    
    static func isField (email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
              let confirmPassword = confirmPassword,
              let email = email,
              password != "",
              confirmPassword != "",
              email != "" else {
            return false
        }
        return true
    }
    
    static func isField (username: String?, description: String?, gender: String?) -> Bool {
        guard let username = username,
              let description = description,
              let gender = gender,
              description != "",
              gender != "",
              username != "" else {
            return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
