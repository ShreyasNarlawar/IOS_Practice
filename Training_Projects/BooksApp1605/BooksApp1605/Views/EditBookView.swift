//
//  EditBookView.swift
//  BooksApp1605
//
//  Created by Shreyas on 19/05/25.
//

import SwiftUI

struct EditbookView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var status = Status.onShelf
    @State private var rating = 0
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    @State private var dateAdded = Date.distantPast
    @State private var dateStarted = Date.distantPast
    @State private var dateCompleted = Date.distantPast

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
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
                                DatePicker("", selection: $dateStarted, displayedComponents: .date)
                            } label: {
                                Text("Date Started")
                            }
                        }
                    }
                    .foregroundStyle(.secondary)
                    .onChange(of: status) { oldValue, newValue in
                        if newValue == .onShelf {
                            dateStarted = .distantPast
                            dateCompleted = .distantPast
                        } else if newValue == .inProgress && oldValue == .completed {
                            dateStarted = .now
                        } else if newValue == .inProgress && oldValue == .onShelf {
                            dateStarted = .now
                        } else if newValue == .completed && oldValue == .onShelf {
                            dateCompleted = .now
                            dateStarted = dateAdded
                        } else {
                            dateCompleted = .now
                        }
                    }

                    Divider()

                    LabeledContent {
                        RatingView(maxRating: 5, currentRating: $rating, width: 20)
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

                    Section(header: Text("Summary")) {
                        TextEditor(text: $summary)
                            .frame(height: 220)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 3)
                            )
                    }
                }
                .padding()
            }
            .navigationTitle(title.isEmpty ? "Edit Book" : title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Update") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    EditbookView()
}
