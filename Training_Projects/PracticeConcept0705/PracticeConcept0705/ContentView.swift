//
//  ContentView.swift
//  PracticeConcept0705
//
//  Created by Siddhatech on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    var sampleName = "swift Extensions"
    var sampleDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Is Numeric? \(sampleName.isNumeric() ? "YES" : "NO")")
            
            Text(sampleName.capitalizedFirst).foregroundColor(.themeAssent)
            
            Text(sampleName.capitalizedFirst).foregroundColor(.themePrimary)
            
            Text("Today is \(sampleDate.formatted(style: .long))")
                .padding()
                .background(Color.cardBackground)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
