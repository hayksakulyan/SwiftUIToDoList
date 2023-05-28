//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-84000) else {
            return false
        }
        
        return true
    }
}
