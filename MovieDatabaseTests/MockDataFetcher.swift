//
//  MockDataFetcher.swift
//  MovieDatabaseTests
//
//  Created by Sourav on 30/06/24.
//

import Foundation
@testable import MovieDatabase

class MockDataFetcher: DataFetchable {
    func getMovieData() -> [Movie]? {
        return [
            Movie(title: "Movie 1", genre: "Action", year: "2020", actors: "Actor 1", director: "Director 1"),
            Movie(title: "Movie 2", genre: "Drama", year: "2021", actors: "Actor 2", director: "Director 2"),
            Movie(title: "Movie 3", genre: "Comedy", year: "2022", actors: "Actor 3", director: "Director 3")
        ]
    }
}
