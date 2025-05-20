//
//  NewBookView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//
import SwiftUI
import SwiftData

struct NewBookView: View {
    @Environment(\.modelContext) private var context    //from swiftdata
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Book Title", text: $title)
                TextField("Author", text: $author)
                RatingView(maxRating: 5, currentRating: $rating, width: 20)
                Button("Create") {
                    let newBook = Book(title: title, author: author, rating: rating)
                    context.insert(newBook)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty)
                .navigationTitle("New Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
