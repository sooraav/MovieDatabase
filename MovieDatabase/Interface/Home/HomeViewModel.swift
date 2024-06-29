//
//  HomeViewModel.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import Foundation
import SwiftUI

@Observable class HomeViewModel {
    
    var categories = [Category]()
    private var movies = [Movie]()
    var dataFetcher: DataFetchable = DataManager()
    var searchText: String = ""
    var searchResuls: [Movie] {
        
        if searchText.isEmpty {
            
            return movies
        } else {
            
            return movies.filter {
                
                $0.title.lowercased().contains(searchText.lowercased()) || $0.genre.lowercased().contains(searchText.lowercased()) || $0.year.contains(searchText) || $0.actors.lowercased().contains(searchText.lowercased()) || $0.director.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    init() {
        
        getData()
    }
    
    func getData() {
        
        Task.detached(priority: .high) { [self] in
            if let movies = dataFetcher.getMovieData() {
                
                self.movies =  movies
                
                var yearSubCategories: [String: [Movie]] = [:]
                var genreSubCategories: [String: [Movie]] = [:]
                var directorSubCategories: [String: [Movie]] = [:]
                var actorSubCategories: [String: [Movie]] = [:]
                
                // Populate the dictionaries
                for movie in movies {
                    // By Year
                    let yearKey = String(movie.year)
                    if yearSubCategories[yearKey] == nil {
                        yearSubCategories[yearKey] = []
                    }
                    yearSubCategories[yearKey]?.append(movie)
                    
                    // By Genre
                    if genreSubCategories[movie.genre] == nil {
                        genreSubCategories[movie.genre] = []
                    }
                    genreSubCategories[movie.genre]?.append(movie)
                    
                    // By Director
                    if directorSubCategories[movie.director] == nil {
                        directorSubCategories[movie.director] = []
                    }
                    directorSubCategories[movie.director]?.append(movie)
                    
                    // By Actor
                    
                    if actorSubCategories[movie.actors] == nil {
                        actorSubCategories[movie.actors] = []
                    }
                    actorSubCategories[movie.actors]?.append(movie)
                }
                
                categories.append(Category(type: .year, subCategories: convertToSubCategories(from: yearSubCategories)))
                categories.append(Category(type: .genre, subCategories: convertToSubCategories(from: genreSubCategories)))
                categories.append(Category(type: .actors, subCategories: convertToSubCategories(from: actorSubCategories)))
                categories.append(Category(type: .director, subCategories: convertToSubCategories(from: directorSubCategories)))
                categories.append(Category(type: .allMovies, subCategories: [SubCategory(item: "allMovies", movies: movies)]))
            }
        }
    }
    
    private func convertToSubCategories(from dictionary: [String: [Movie]]) -> [SubCategory] {
        return dictionary.map { SubCategory(item: $0.key, movies: $0.value) }
    }
}
