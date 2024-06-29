//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Bindable var model: MovieDetailViewModel
    var body: some View {
        ScrollView {
                   VStack( spacing: 16) {
                       AsyncImage(url: URL(string: model.movie.poster ?? "")) { image in
                           image
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .cornerRadius(10)
                       } placeholder: {
                           ProgressView()
                       }
                       .frame(height: 300)
                       .padding()

                       VStack(spacing: 8) {
                           VStack(alignment: .center) {
                               Text(model.movie.title)
                                   .font(.title)
                                   .bold()
                                   .multilineTextAlignment(.leading)
                               
                               Text(model.movie.plot)
                                   .font(.body)
                                   .multilineTextAlignment(.leading)
                           }

                           Divider()
                           HStack {
                               VStack(alignment: .leading) {
                                   Text("Actors: \(model.movie.actors)")
                                       .font(.body)
                                       .multilineTextAlignment(.leading)
                                   
                                   Text("Director: \(model.movie.director)")
                                       .font(.body)
                                       .multilineTextAlignment(.leading)
                                   
                                   Text("Writer: \(model.movie.writer)")
                                       .font(.body)
                                       .multilineTextAlignment(.leading)
                                   
                                   Text("Release Date: \(model.movie.released)")
                                       .font(.body)
                                       .multilineTextAlignment(.leading)
                               }
                               Spacer()
                           }
                           
                           
                           Divider()
                            Text("Ratings")
                               .font(.headline)
                           Picker("Rating source", selection: $model.selectedRating) {
                               ForEach(model.movie.ratings, id: \.source) { rating in
                                   Text(rating.source).tag(rating)
                               }
                           }
                           
                           Text("Rating: \(model.selectedRating.value)")
                               .font(.body)
                               .padding(.top, 8)
                       }
                       .padding(.horizontal)
                   }
                   .navigationBarTitle(Text(model.movie.title), displayMode: .inline)
               }
           }
}

#Preview {
    MovieDetailView(model: MovieDetailViewModel(movie: Movie(title: "title",
                                                             year: "year",
                                                             rated: "4.5",
                                                             released: "1234",
                                                             runtime: "2",
                                                             genre: "comedy",
                                                             director: "yoho",
                                                             writer: "writer",
                                                             actors: "actor",
                                                             plot: "plotter",
                                                             language: "langauge, language",
                                                             country: "India, China",
                                                             awards: "2 awards",
                                                             poster: "https://m.media-amazon.com/images/M/MV5BNDRlZTU2ZWQtNzdjNS00ODg1LWFlNWItNzNmYWI0MmI3ZDQ2XkEyXkFqcGdeQXVyMTk5MTg1OTg@._V1_SX300.jpg",
                                                             ratings: [Rating(source: "imdb", value: "8.88"),
                                                                       Rating(source: "imkdb", value: "8")],
                                                             metascore: "5",
                                                             imdbRating: "4",
                                                             imdbVotes: "4",
                                                             imdbID: "heelmd",
                                                             type: "dcddc",
                                                             dvd: "gogo",
                                                             boxOffice: "100m",
                                                             production: "20m",
                                                             website: "www.hsjs.com",
                                                             response: "dcscdc")))
}
