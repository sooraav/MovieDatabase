//
//  ContentView.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
   
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.searchText.isEmpty {
                    CategoryListView(categories: viewModel.categories)
                } else {
                    List {
                        MovieListView(movies: viewModel.searchResults)
                    }
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                
                MovieDetailView(model: MovieDetailViewModel(movie: movie))
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchText)
        }
    }
}

#Preview {
    HomeView()
}
