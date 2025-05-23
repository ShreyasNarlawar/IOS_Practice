//
//  UBER_Clone2105App.swift
//  UBER-Clone2105
//
//  Created by Siddhatech on 21/05/25.
//

import SwiftUI

@main
struct UBER_Clone2105App: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
