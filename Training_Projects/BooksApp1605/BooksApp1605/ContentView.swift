//
//  ContentView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//
import SwiftUI

struct ContentView:View {
    @State var moveRight = false
    @State var percentage = 0
    @State var trimValue = 0.0
    
    var body: some View {
        GeometryReader { geo in
            let screenHeight = geo.size.height
            
            ZStack {
                ZStack(alignment: .bottom){
                    Image("ic-background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Circle()
                        .trim(from: 0,to: trimValue)
                        .stroke(Color.yellow.opacity(0.75), lineWidth:10)
                        .rotationEffect(.degrees(180))
                        .padding(.bottom, -screenHeight * 0.27)
                        .opacity(percentage > 102 ? 0 : 1)
                    
                    Text(percentage > 100 ? "Complete!" : "\(percentage) %")
                        .contentTransition(.numericText(value: Double(percentage)))
                        .font(.system(size: 40))
                        .foregroundStyle(.yellow)
                        .bold()
                        .opacity(percentage > 102 ? 0 : 1)
                }
                
                Image("ic-moving-img")
                    .resizable()
                    .frame(width: 220,height: 170)
                    .offset(y:moveRight ? 20 : -20)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: moveRight)
                    .offset(y:percentage > 103 ? -screenHeight : 0)
                    .animation(.easeInOut(duration: 1.6), value: percentage)
                
                BookListView()
                    .offset(y: percentage > 104 ? 0 : screenHeight + 34)
                    .animation(.easeInOut(duration: 1.6), value: percentage)
            }
            .onAppear {
                moveRight = true
                withAnimation(.easeInOut(duration:5)) {
                    trimValue = 0.52
                }
                Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
                    withAnimation(.bouncy) {
                        if percentage <= 105 {
                            percentage += 1
                        }
                    }
                }
            }
        }
    }
}
