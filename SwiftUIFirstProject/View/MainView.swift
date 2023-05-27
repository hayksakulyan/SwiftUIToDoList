//
//  ContentView.swift
//  SwiftUIFirstProject
//
//  Created by Hayk Sakulyan on 22.05.23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSigned != false, !viewModel.curentUserId.isEmpty {
            // Signed in
            TabView {
                ToDoListView()
                    .tabItem {
                    Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                    Label("Profile", systemImage: "person.circle")
                    }
                
            }
        } else {
            LoginView()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            
    }
}
