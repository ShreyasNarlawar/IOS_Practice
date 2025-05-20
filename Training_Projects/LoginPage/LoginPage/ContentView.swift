//
//  ContentView.swift
//  LoginPage
//
//  Created by Siddhatech on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    // Access API key at the top level
    private let apiKey = APIforPractice.apiKey

    var body: some View {
        VStack {
            Text("KEY = \(apiKey)")
        }
    }
}

struct APIforPractice {
    static var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        return key
    }
}
#Preview {
    ContentView()
}
