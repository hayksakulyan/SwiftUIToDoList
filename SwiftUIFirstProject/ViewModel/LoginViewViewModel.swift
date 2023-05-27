//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    func login() {
        guard validete() else {
            return
        }
        
        // Try to log in
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    func validete() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "please fill in all email"
            return false
        }
        
        // hayko828@mail.ru
        
       
        return true
    }
}
