//
//  Books.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//
import Foundation
import SwiftData

@Model
class Book: Identifiable {
    var id: UUID
    var title: String
    var author: String
    var summary: String
    var rating: Int
    var status: Status
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date

    init(title: String,
         author: String,
         summary: String,
         rating: Int = 0,
         status: Status = .onShelf,
         dateAdded: Date = .now,
         dateStarted: Date = .distantPast,
         dateCompleted: Date = .distantPast
    ) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.summary = summary
        self.rating = rating
        self.status = status
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
    }
}

enum Status: String, CaseIterable, Identifiable, Codable {
    case onShelf, inProgress, completed

    var id: String { rawValue }

    var descr: String {
        switch self {
        case .onShelf: return "On Shelf"
        case .inProgress: return "In Progress"
        case .completed: return "Completed"
        }
    }
}

