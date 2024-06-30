//
//  AsyncImageView.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import SwiftUI

struct AsyncImageView: View {
    let imageUrl: String?
    var body: some View {
        if let imageUrl {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                case .failure(_):
                    Image("ImagePlaceholder")
                        .resizable()
                case .empty:
                    ProgressView()
                @unknown default:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .foregroundColor(.red)
                }
            }
        } else {
            Image("ImagePlaceholder")
                .resizable()
        }
    }
}

#Preview {
    AsyncImageView(imageUrl: "https://m.media-amazon.com/images/M/MV5BNDRlZTU2ZWQtNzdjNS00ODg1LWFlNWItNzNmYWI0MmI3ZDQ2XkEyXkFqcGdeQXVyMTk5MTg1OTg@._V1_SX300.jpg")
}
