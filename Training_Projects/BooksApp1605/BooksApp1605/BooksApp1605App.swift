//
//  BooksApp1605App.swift
//  BooksApp1605
//
//  Created by Siddhatech on 19/05/25.
//

import SwiftUI
import SwiftData

@main
struct BooksApp1605App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        } .modelContainer(for: Book.self)
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
