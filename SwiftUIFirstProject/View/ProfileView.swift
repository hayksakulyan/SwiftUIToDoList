//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Hayk Sakulyan on 23.05.23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                   
                } else {
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
                .toolbar {
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "plus")
                    }

                }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        //info name email
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.top, 3)
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.top, 3)
            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened)) ")
            }
            .padding(.top, 3)
        }
        .padding()
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
        // sign out
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
