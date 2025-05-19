//
//  LoginScreenView.swift
//  SplashScreen1205
//
//  Created by Shreyas on 12/05/25.
//

import SwiftUI

struct LoginScreenView: View {
    @State var tempText = ""
    @State var passwordText = ""
    
    var body: some View {
        VStack{
                Image("ic-logo")
                    .resizable()
                    .frame(width: 300,height: 250)
                    .shadow(radius: 10)
                
                Text("Daily News")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
                    .bold()
                    .shadow(radius: 50)
                    .padding(.top,-70)
            
            VStack(spacing:20){
                TextField("Email",text: $tempText)
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
                    .frame(width: 300, height: 50)
                    .background(.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 10)
                
                SecureField("Password",text: $passwordText)
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
                    .frame(width: 300, height: 50)
                    .background(.white.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 10)
            }
            .padding(.top,50)
            
            Button(action: {
                
            }, label: {
                Text("Login")
                    .bold()
                    .font(.system(size:20))
            })
            .frame(width: 150,height: 40)
            .background(.purple.opacity(0.7))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 100)
            .padding()
        }
    }
}
