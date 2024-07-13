//
//  DataManager.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import Foundation

protocol DataFetchable {
    
    func getMovieData() async -> [Movie]?
}
class DataManager: DataFetchable {
    
    // Function to parse data to movie array
    private func parseMovies(from jsonData: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        do {
            let movies = try decoder.decode([Movie].self, from: jsonData)
            return movies
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    // Function to getMovieData from the json file
    func getMovieData() async -> [Movie]? {
        
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            
               return parseMovies(from: data)
        }
        return nil
    }
}
