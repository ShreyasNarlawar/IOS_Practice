//
//  EditBookView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//
import SwiftUI

struct EditBookView: View {
    @Environment(\.dismiss) private var dismiss
    let book: Book

    @State private var status = Status.onShelf
    @State private var rating : Int?
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var dateAdded = Date.distantPast
    @State private var dateStarted = Date.distantPast
    @State private var dateCompleted = Date.distantPast
    @State private var firstView = true

    // Computed binding to safely use optional Int
    private var nonOptionalRating: Binding<Int> {
        Binding<Int>(
            get: { rating ?? 0 },
            set: { rating = $0 }
        )
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Status")
                Picker("Status", selection: $status) {
                    ForEach(Status.allCases) { status in
                        Text(status.descr).tag(status)
                    }
                }
                .buttonStyle(.bordered)
            }

            GroupBox {
                LabeledContent {
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label: {
                    Text("Date Added")
                }

                if status == .inProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, in: dateAdded..., displayedComponents: .date)
                    } label: {
                        Text("Date Started")
                    }
                }

                if status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateCompleted, in: dateStarted..., displayedComponents: .date)
                    } label: {
                        Text("Date Completed")
                    }
                }
            }
            .foregroundStyle(.secondary)
            .onChange(of: status) { oldValue, newValue in
                if !firstView {
                    if newValue == .onShelf {
                        dateStarted = .distantPast
                        dateCompleted = .distantPast
                    } else if newValue == .inProgress && oldValue == .completed {
                        dateCompleted = .distantPast
                    } else if newValue == .inProgress && oldValue == .onShelf {
                        dateStarted = .now
                    } else if newValue == .completed && oldValue == .onShelf {
                        dateCompleted = .now
                        dateStarted = dateAdded
                    } else {
                        dateCompleted = .now
                    }
                }
                firstView = false
            }

            Divider()

            LabeledContent {
                RatingView(maxRating: 5, currentRating: nonOptionalRating, width: 20)
            } label: {
                Text("Rating")
            }

            LabeledContent {
                TextField("", text: $title)
            } label: {
                Text("Title").foregroundStyle(.secondary)
            }

            LabeledContent {
                TextField("", text: $author)
            } label: {
                Text("Author").foregroundStyle(.secondary)
            }

            Divider()
            Text("Summary").foregroundStyle(.secondary)
            TextEditor(text: $summary)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2)
                )
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if changed {
                Button("Update") {
                    book.status = status
                    book.rating = rating ?? 1
                    book.title = title
                    book.author = author
                    book.summary = summary
                    book.dateAdded = dateAdded
                    book.dateStarted = dateStarted
                    book.dateCompleted = dateCompleted
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .onAppear {
            status = book.status
            rating = book.rating
            title = book.title
            author = book.author
            summary = book.summary
            dateAdded = book.dateAdded
            dateStarted = book.dateStarted
            dateCompleted = book.dateCompleted
        }
    }

    var changed: Bool {
        status != book.status ||
        rating != book.rating ||
        title != book.title ||
        author != book.author ||
        summary != book.summary ||
        dateAdded != book.dateAdded ||
        dateStarted != book.dateStarted ||
        dateCompleted != book.dateCompleted
    }
}
