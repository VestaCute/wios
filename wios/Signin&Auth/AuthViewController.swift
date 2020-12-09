//
//  ViewController.swift
//  wios
//
//  Created by Sasha Kondratjeva on 30.11.2020.
//

import UIKit
import SwiftUI

class AuthViewController: UIViewController {
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo_x2"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "")
    let emailLabel = UILabel(text: "")
    let alreadyOnBoardLabel = UILabel(text: "")
    
    let emailButton = UIButton(title: "Get started", titleColor: .white, backgroundColor: .link, isShadow: true)
    let googleButton = UIButton(title: "Or sign up with Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let loginButton = UIButton(title: "Login", titleColor: .link, backgroundColor: .white, isShadow: true)
    
    let signUpVC = SingUpViewController()
    let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.costomizedGoogleButtom()
        view.backgroundColor = .white
        setupConstarains()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func emailButtonTapped() {
        print (#function)
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print (#function)
        present(loginVC, animated: true, completion: nil)
    }
}
// Setup Constains
extension AuthViewController {
    private func setupConstarains() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let googleView = ButtomFormView(label: googleLabel, button: googleButton)
        let emailView = ButtomFormView(label: emailLabel, button: emailButton)
        let loginView = ButtomFormView(label: alreadyOnBoardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 25
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
    
}

// Begin SwiftUI
struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
