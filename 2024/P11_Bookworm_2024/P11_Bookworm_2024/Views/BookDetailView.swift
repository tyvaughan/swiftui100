//
//  BookDetailView.swift
//  P11_Bookworm_2024
//
//  Created by  Ty Vaughan on 3/14/24.
//

import SwiftData
import SwiftUI

struct BookDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
                .padding(.bottom)
            
            VStack(spacing: 10) {
                RatingView(rating: .constant(book.rating))
                    .font(.largeTitle)
                
                Text(book.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.title2)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom)
    
            Text(book.review)
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Book.self, configurations: config)
    let example = Book(title: "Test book", author: "Test Author", genre: "Fantasy", review: "What an amazing adventure!", rating: 5, date: Date())

    return NavigationStack {
        BookDetailView(book: example)
    }
}
