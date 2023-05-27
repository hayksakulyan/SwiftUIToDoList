//
//  User.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//

import Foundation

struct User: Codable {
    var id: String
    var name: String
    var email: String
    var joined: TimeInterval
}
