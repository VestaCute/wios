//
//  SetupProfileView.swift
//  wios
//
//  Created by Sasha Kondratjeva on 03.12.2020.
//

import UIKit
import SwiftUI
import FirebaseAuth

class SetupProfileViewController: UIViewController {
    
    let fullNameLabel = UILabel(text: "Full Name")
    let AboutMeLabel = UILabel(text: "About me")
    let genderLabel = UILabel(text: "Gender")
    
    let fullNameTextField = OneLineTextField(font: .SFPro20())
    let aboutMeTextField = OneLineTextField(font: .SFPro20())
    let genderSegmentedControll = UISegmentedControl(first: "Male", second: "Femail", other: "Other")
    
    let goToChatsButtom = UIButton(title: "Done", titleColor: .white, backgroundColor: .link, cornerRarius: 4)
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let fullImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setupConstraints()
        goToChatsButtom.addTarget(self, action: #selector(goToChatsButtomTapped), for: .touchUpInside)
    }
    @objc private func goToChatsButtomTapped() {
        FirestoreService.shared.saveProfileWith(id: currentUser.uid, email: currentUser.email!, username: fullNameTextField.text, avatarImageString: "Not now", description: aboutMeTextField.text, gender: genderSegmentedControll.titleForSegment(at: genderSegmentedControll.selectedSegmentIndex)) { (result) in
            switch result {
            
            case .success(_):
                return
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
            }
        }
    }
}

// Setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [AboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let genderStackView = UIStackView(arrangedSubviews: [genderLabel, genderSegmentedControll], axis: .vertical, spacing: 20)
        
        goToChatsButtom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, genderStackView, goToChatsButtom], axis: .vertical, spacing: 40)
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

// SwiftUI
struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: Context) -> SetupProfileViewController {
            return setupProfileVC
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
