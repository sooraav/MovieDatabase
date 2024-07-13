//
//  MovieListSortView.swift
//  MovieDatabase
//
//  Created by Sourav on 13/07/24.
//

import SwiftUI

struct MovieListSortView: View {
    var pickerItems = ["Ascending", "Descending", "Year"]
    @State var pickerSelection: String = "Ascending"
    @State var movies: [Movie]?
    
    
    var body: some View {
        List {
            ForEach(movies ?? [Movie]()) { movie in
                
                NavigationLink(value: movie) {
                    MovieCellView(title: movie.title,
                                  language: movie.language,
                                  imageUrl: movie.poster,
                                  year: movie.year)
                }
            }
        }
        .navigationTitle("All Movies")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Sort", selection: $pickerSelection) {
                    ForEach(pickerItems, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .onChange(of: pickerSelection) {
            
            sortMovies()
        }
        .onAppear {
            
            sortMovies()
        }
    }
    
    // function to sort movies according to picker selection
    private func sortMovies() {
        
           switch pickerSelection {
           case "Year":
               movies = movies?.sorted { $0.year < $1.year }
           case "Descending":
               movies = movies?.sorted { $0.title > $1.title }
           default:
               movies = movies?.sorted { $0.title < $1.title }
           }
    }
}

#Preview {
    MovieListView(movies: [
        Movie(title: "Movie 1", genre: "Action", year: "2020", actors: "Actor 1", director: "Director 1"),
        Movie(title: "Movie 2", genre: "Drama", year: "2021", actors: "Actor 2", director: "Director 2"),
        Movie(title: "Movie 3", genre: "Comedy", year: "2022", actors: "Actor 3", director: "Director 3")
    ])
}
