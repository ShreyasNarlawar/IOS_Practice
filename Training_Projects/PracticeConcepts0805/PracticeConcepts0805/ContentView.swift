//
//  ContentView.swift
//  PracticeConcepts0805
//
//  Created by Siddhatech on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                let isLandscape = geometry.size.width > geometry.size.height
                
                VStack(spacing: 20) {
                    Text("Current Orientation:")
                        .font(.title2)
                    
                    Text(isLandscape ? "Landscape" : "Portrait")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(isLandscape ? .brown : .orange)
                    
                    if isLandscape {
                        HStack {
                            Image(systemName: "rectangle.split.3x3")
                            Text("Landscape Layout")
                        }
                    } else {
                        VStack {
                            Image(systemName: "rectangle.split.1x2")
                            Text("Portrait Layout")
                        }
                    }
                    
                    NavigationLink(destination: NumberFormatterView()){
                        Text("Currency")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    NavigationLink(destination: RegionTimeZone()){
                        Text("TimeZone")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
