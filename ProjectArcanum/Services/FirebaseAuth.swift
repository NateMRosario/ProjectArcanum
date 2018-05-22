//
//  FirebaseAuth.swift
//  ProjectArcanum
//
//  Created by C4Q on 4/24/18.
//  Copyright © 2018 Fr0st. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

enum Problems: Error {
    case emptyCardArrayInCategory
    case userHasNoCategory
    case noUserSignedIn
}

class FirebaseManager {
    static let shared = FirebaseManager()
    private init() {
        dataBaseRef = Database.database().reference()
        usersReference = dataBaseRef.child("users")
    }
    private var dataBaseRef: DatabaseReference!
    private var usersReference: DatabaseReference!
    private var categoryReference: DatabaseReference!
    private var cardReference: DatabaseReference!
    
    /// User functions
    public func getCurrentUser() -> User? {
        if Auth.auth().currentUser != nil {
            return Auth.auth().currentUser
        }
        return nil
    }
    
    public func getUserFrom(uid: String, completionHandler: @escaping (CurrentUser) -> Void, errorHandler: @escaping (Error) -> Void) {
        usersReference.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            if let json = snapshot.value {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let user = try JSONDecoder().decode(CurrentUser.self, from: jsonData)
                    completionHandler(user)
                } catch {
                    errorHandler(error)
                }
            }
        }
    }
    public func login(withEmail email: String, andPassword password: String, completionHandler: @escaping (User?, Error?) -> Void) {
        let completion: (User?, Error?) -> Void = { (user, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let user = user {
                completionHandler(user, nil)
            }
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    public func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    public func createAccount(email: String, password: String, name: String, completionHandler: @escaping (User?, Error?) -> Void) {
        let completion: (User?, Error?) -> Void = { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let user = user {
                let child = self.usersReference.child(user.uid)
                child.setValue(CurrentUser(name: name, isDM: nil, charSheet: nil, gameRooms: nil).userToJson())
                
                ///Send verification email
                user.sendEmailVerification(completion: { (error) in
                    if let error = error {
                        print(error)
                    } else {
                        print("verification email sent")
                    }
                })
            }
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    public func forgotPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    public func getUsernameFromUID(uid: String, completionHandler: @escaping (String) -> Void, errorHandler: @escaping (Error) -> Void) {
        usersReference.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            if let json = snapshot.value {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let user = try JSONDecoder().decode(CurrentUser.self, from: jsonData)
                    completionHandler(user.name)
                } catch {
                    errorHandler(error)
                }
            }
        }
    }
}
