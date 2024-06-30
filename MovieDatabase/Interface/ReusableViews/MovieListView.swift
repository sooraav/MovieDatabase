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
                              imageUrl: movie.poster ?? "",
                              year: movie.year)
            }
        }
    }
}
/*
#Preview {
    MovieListView()
}*/
