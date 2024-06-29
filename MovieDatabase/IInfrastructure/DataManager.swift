//
//  DataManager.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import Foundation

protocol DataFetchable {
    
    func getMovieData() -> [Movie]?
}
class DataManager: DataFetchable {
    
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
    
    
    func getMovieData() -> [Movie]? {
        
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            
               return parseMovies(from: data)
        }
        return nil
    }
}
