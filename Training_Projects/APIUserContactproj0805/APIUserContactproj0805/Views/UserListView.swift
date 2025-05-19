//
//  UserListView.swift
//  APIUserContactproj0805
//
//  Created by Shreyas on 09/05/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()
    var body: some View {
        NavigationView{
            LinearGradient(
                colors:[ Color.purple, Color.red],
                startPoint: .topTrailing,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .overlay(
                ScrollView{
                    LazyVStack(spacing: 10){
                        ForEach(viewModel.users){ user in
                            NavigationLink(destination: UserDetailView(user: user)){
                                UserCardView(user:user)
                            }
                        }
                    }
                    .padding()
                }
            )
            .navigationTitle("Contacts")
        }
        .onAppear{
            viewModel.loadUsers()
        }
    }
}
