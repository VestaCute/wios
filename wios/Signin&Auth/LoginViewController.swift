//
//  LoginViewController.swift
//  wios
//
//  Created by Sasha Kondratjeva on 02.12.2020.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    let loginWithLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let needAnAccounLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailTextField = OneLineTextField(font: .SFPro20())
    let passwordTextField = OneLineTextField(font: .SFPro20())
    let loginButtom = UIButton(title: "Login", titleColor: .white, backgroundColor: .black)
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sing Up", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .SFPro20()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.costomizedGoogleButtom()
        view.backgroundColor = .white
        setupConstraints()
    }
}


// Setup Constraints
extension LoginViewController {
    private func setupConstraints() {
        let loginWithView = ButtomFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel,emailTextField], axis: .vertical, spacing: 0)
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel,passwordTextField], axis: .vertical, spacing: 0)
        
        loginButtom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [loginWithView,orLabel,emailStackView,passwordStackView, loginButtom], axis: .vertical, spacing: 40)
        
        signInButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccounLabel,signInButton], axis: .horizontal, spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// SwiftUI
struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let loginVC = LoginViewController()
        
        func makeUIViewController(context: Context) -> LoginViewController {
            return loginVC
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
