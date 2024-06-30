//
//  MovieCellView.swift
//  MovieDatabase
//
//  Created by Sourav on 29/06/24.
//

import SwiftUI

struct MovieCellView: View {
    let title: String
    let language: String
    let imageUrl: String?
    let year: String
    var body: some View {
        
        HStack {
            AsyncImageView(imageUrl: imageUrl)
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .lineLimit(3)
                Text("Language: \(language)")
                    .lineLimit(2)
                    .font(.caption)
                Text("Year: \(year)")
                    .font(.caption)
                Spacer()
            }
            Spacer()
        }
        .frame(height: 135)
    }
}

#Preview {
    MovieCellView(title: "No Limit", language: "No Limit", imageUrl: "https://m.media-amazon.com/images/M/MV5BNDRlZTU2ZWQtNzdjNS00ODg1LWFlNWItNzNmYWI0MmI3ZDQ2XkEyXkFqcGdeQXVyMTk5MTg1OTg@._V1_SX300.jpg", year: "1990")
}
