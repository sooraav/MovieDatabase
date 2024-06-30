//
//  MovieListView.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import SwiftUI

struct MovieListView: View {
    var movies: [Movie]
    
    var body: some View {
        ForEach(movies) { movie in
            NavigationLink(value: movie) {
                MovieCellView(title: movie.title,
                              language: movie.language,
                              imageUrl: movie.poster,
                              year: movie.year)
            }
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
