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
                    List(viewModel.categories, id: \.type) { row in
                        DisclosureGroup {
                            ForEach(row.subCategories) { subCategory in
                                
                                DisclosureGroup {
                                    
                                    ForEach(subCategory.movies) { movie in
                                        NavigationLink(value: movie) { MovieCellView(title: movie.title,
                                                                                     language: movie.language,
                                                                                     imageUrl: movie.poster ?? "",
                                                                                     year: movie.year)
                                        }
                                    }
                                        
                                } label: {
                                    Text( subCategory.item)
                                }
                                
                            }
                        } label: {
                            Text(row.type.rawValue)
                        }
                        
                    }
                } else {
                    
                    List(viewModel.searchResuls) { movie in
                        
                        NavigationLink(value: movie) { MovieCellView(title: movie.title,
                                                                     language: movie.language,
                                                                     imageUrl: movie.poster ?? "",
                                                                     year: movie.year)
                        }
                    }
                }
            }
            .navigationDestination(for: Movie.self) { movie in
                
                MovieDetailView()
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.searchText)
        }
    }
}

#Preview {
    HomeView()
}
