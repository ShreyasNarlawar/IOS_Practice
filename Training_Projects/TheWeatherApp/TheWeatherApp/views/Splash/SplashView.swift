//
//  SplashView.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//

import SwiftUI

struct SplashView: View {
    @State private var navigate = false

    var body: some View {
        ZStack {
            if navigate {
                NavigationView {
                    HomeView()
                        .transition(.opacity)
                }
            } else {
                LottieView(filename: "namstelottie")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                navigate = true
                            }
                        }
                    }
            }
        }
    }
}
