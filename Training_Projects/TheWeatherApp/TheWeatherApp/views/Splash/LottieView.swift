//
//  LottieView.swift
//  TheWeatherApp
//
//  Created by Shreyas on 13/05/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let filename: String
    var loopMode: LottieLoopMode = .loop
    var renderingEngine: RenderingEngineOption = .automatic
   
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: filename)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.configuration = LottieConfiguration(renderingEngine: renderingEngine)
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
