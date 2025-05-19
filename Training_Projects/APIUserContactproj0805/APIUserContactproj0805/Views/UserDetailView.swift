//
//  UserDetailView.swift
//  APIUserContactproj0805
//
//  Created by Shreyas on 09/05/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors:[ Color.purple, Color.red],
                startPoint: .topTrailing,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack{
                ScrollView{
                    VStack(spacing:20){
                        Spacer(minLength: 20)
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80,height: 80)
                            .foregroundStyle(.blue)
                        
                        Text(user.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("@\(user.username)")
                            .foregroundColor(.secondary)
                        
                        Divider()
                        
                        VStack(alignment: .leading , spacing: 8){
                            Text("Email: \(user.email)")
                            Text("Phone: \(user.phone)")
                            Text("Website: \(user.website)")
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("Company")
                                .font(.headline)
                            Text(user.company.name)
                            Text(user.company.catchPhrase)
                                .italic()
                            Text(user.company.bs)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    dismiss()
                }){
                    HStack{
                        Text("EXIT")
                            .fontWeight(.semibold)
                        Image(systemName: "xmark.circle")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
