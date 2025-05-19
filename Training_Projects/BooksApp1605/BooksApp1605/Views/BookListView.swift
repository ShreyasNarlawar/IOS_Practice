//
//  BookListView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//

//
//  BookListView.swift
//  ProjectUsingSwiftData1605
//
//  Created by Shreyas on 16/05/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Book.title) private var books: [Book]
    @State private var createNewBook = false

    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView("No Books", systemImage: "book", description: Text("Tap '+' to add a new book."))
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(book.title)
                                        .font(.title)
                                        .bold()
                                    
                                    Text("by \(book.author)")
                                        .font(.headline)

                                    if !book.summary.isEmpty {
                                        Text(book.summary)
                                            .font(.body)
                                            .foregroundStyle(.secondary)
                                    } else {
                                        Text("No summary available.")
                                            .foregroundStyle(.tertiary)
                                    }

                                    Spacer()
                                }
                                .padding()
                                .navigationTitle("Book Details")
                                .navigationBarTitleDisplayMode(.inline)

                                // Uncomment this after EditbookView is updated to accept a book
                                // EditbookView(book: book)
                            } label: {
                                HStack(spacing: 10) {
                                    book.icon
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(book.title)
                                            .font(.title2)

                                        Text(book.author)
                                            .foregroundStyle(.secondary)

                                        HStack(spacing: 2) {
                                            ForEach(0..<book.rating, id: \.self) { _ in
                                                Image(systemName: "star.fill")
                                                    .imageScale(.small)
                                                    .foregroundStyle(.yellow)
                                            }
                                        }

                                        if !book.summary.isEmpty {
                                            Text(book.summary)
                                                .font(.caption)
                                                .foregroundStyle(.gray)
                                                .lineLimit(1)
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("My Books")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook) {
                NewBookView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    BookListView()
        .modelContainer(for: Book.self, inMemory: true)
}
