//
//  Firestoreservice.swift
//  wios
//
//  Created by Sasha Kondratjeva on 10.12.2020.
//

import Foundation
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return db.collection("users")
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, gender: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isField(username: username, description: description, gender: gender) else {
            completion(.failure(UserError.notField))
            return
        }
        
        let mUser = MUser(username: username!, email: email, avatarStringURL: "Not now", description: description!, gender: gender!, id: id)
        self.userRef.document(mUser.id).setData(mUser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(mUser))
            }
        }
    }
}
