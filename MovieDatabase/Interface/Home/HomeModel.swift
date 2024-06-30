//
//  HomeModel.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    
    let id = UUID()
    let title: String
    let year: String
    let rated: String?
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String?
    let poster: String?
    let ratings: [Rating]
    let metascore: String?
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let type: String
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let response: String

    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Movie {
    init(title: String, genre: String, year: String, actors: String, director: String) {
            self.init(
                title: title,
                year: year,
                rated: nil,
                released: "",
                runtime: "",
                genre: genre,
                director: director,
                writer: "",
                actors: actors,
                plot: "",
                language: "",
                country: "",
                awards: nil,
                poster: nil,
                ratings: [],
                metascore: nil,
                imdbRating: "",
                imdbVotes: "",
                imdbID: "",
                type: "",
                dvd: nil,
                boxOffice: nil,
                production: nil,
                website: nil,
                response: ""
            )
        }
}

// Rating model
struct Rating: Codable, Hashable {
    
    let source: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

struct Category {
    var type: DisplayType
    var subCategories: [SubCategory]
}

struct SubCategory: Identifiable {
    var id = UUID()
    var item: String
    var movies: [Movie]
}

enum DisplayType: String {
    
    case year = "Year"
    case genre = "Genre"
    case director = "Directors"
    case actors = "Actors"
    case allMovies = "All Movies"
    
}
