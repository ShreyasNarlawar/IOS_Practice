//
//  UserCardView.swift
//  APIUserContactproj0805
//
//  Created by Shreyas on 08/05/25.
//

import SwiftUI

struct UserCardView: View {
    let user: User
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40,height: 40)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
            }
            .foregroundColor(.black)
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.cyan)
        }
        .padding()
        .background(Color.white.opacity(0.5))
        .cornerRadius(11)
        .shadow(radius: 2.2)
    }
}
