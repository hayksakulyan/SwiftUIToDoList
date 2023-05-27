//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    
    @Published var curentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.curentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSigned: Bool {
        return FirebaseAuth.Auth.auth().currentUser != nil
    }
}
