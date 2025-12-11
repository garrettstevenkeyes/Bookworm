//
//  AddBookView.swift
//  BookWorm
//
//  Created by Garrett Keyes on 12/8/25.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = "Fantasy"
    @State private var rating: Int = 3
    @State private var review: String = ""
    
    let genres = ["Fantasy", "Science Fiction", "Romance", "Mystery", "Horror"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre).tag(genre)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save"){
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )
                        
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle(Text("Add Book"))
        }
    }
}

#Preview {
    AddBookView()
}
