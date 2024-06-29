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
       
        List(viewModel.categories, id: \.type) { row in
            DisclosureGroup {
                ForEach(row.subCategories) { subCategory in
                    
                    DisclosureGroup {
                        
                        ForEach(subCategory.movies) { movie in
                            Text(movie.title)
                        }
                    } label: {
                        Text( subCategory.item)
                    }

                }
            } label: {
                Text(row.type.rawValue)
            }
           
        }
    }
}

#Preview {
    HomeView()
}
