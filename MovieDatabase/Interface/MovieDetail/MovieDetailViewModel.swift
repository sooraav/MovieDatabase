//
//  MovieDetailViewModel.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import Foundation
import SwiftUI

@Observable class MovieDetailViewModel {
    
    var movie: Movie
    var selectedRating: Rating
    init(movie: Movie) {
        self.movie = movie
        self.selectedRating = movie.ratings[0]
        
    }
}
