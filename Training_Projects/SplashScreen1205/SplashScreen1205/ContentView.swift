//
//  ContentView.swift
//  SplashScreen1205
//
//  Created by Shreyas on 12/05/25.
//

import SwiftUI

struct ContentView: View {
    @State var moveRight = false
    @State var percentage = 0
    @State var trimValue = 0.0
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom){
                Image("ic-background")
                    .resizable()
                    .ignoresSafeArea()
                
                Circle()
                    .trim(from: 0,to: trimValue)
                    .stroke(Color.white.opacity(0.7), lineWidth:30)
                    .rotationEffect(.degrees(180))
                    .padding(.bottom,-228)
                    .opacity(percentage > 100 + 2 ? 0 : 1)
                
                Text(percentage > 100 ? "Complete!" : "\(percentage) %")
                    .contentTransition(.numericText(value: Double(percentage)))
                    .font(percentage > 100 ? .system(size: 40) : .system(size: 40))
                    .foregroundStyle(.black)
                    .bold()
                    .opacity(percentage > 102 ? 0 : 1)
            }
            
            Image("ic-moving-img")
                .resizable()
                .frame(width: 400,height: 200)
                .offset(y:moveRight ? 20 : -20)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: moveRight)
                .offset(y:percentage > 100 + 3 ? -800 : 0)
                .animation(.easeInOut(duration: 1.6), value: percentage)
            
//            LoginScreenView()
            NewsListView()
                .offset(y: percentage > 100 + 4 ? 0 : 800)
                .animation(.easeInOut(duration: 1.6), value: percentage)
        }
        .onAppear{
            moveRight = true
            withAnimation(.easeInOut(duration:5)){
                trimValue = 0.52
            }
            Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true){
                Timer in
                withAnimation(.bouncy){
                    if percentage <= 105{
                        percentage += 1
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
