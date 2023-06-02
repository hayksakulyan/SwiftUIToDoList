//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todoes")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
