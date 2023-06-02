//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showNewItemView = false
    
    private let userId: String
    
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete todo list item
    /// - Parameter id: item id to delete
    func deleteItems(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todoes")
            .document(id)
            .delete()
    }
    
}
