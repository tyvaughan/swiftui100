//
//  AddBookView.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/13/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    @State private var date = Date()

    private let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var isBookValid: Bool {
        if (title.isEmpty || author.isEmpty) {
            return false
        }
        return true
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                Picker("Genre", selection: $genre) {
                    ForEach(genres, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            Section {
                RatingView(rating: $rating)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextEditor(text: $review)
            }
            
            Section {
                Button("Save", action: saveBook)
                    .disabled(!isBookValid)
            }
        }
        .navigationTitle("Add Book")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveBook() -> Void {
        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: date)
        modelContext.insert(newBook)
        dismiss()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Book.self, configurations: config)
    
    return NavigationStack {
        AddBookView()
            .modelContainer(container)
    }
}
