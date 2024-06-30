//
//  SubCategoryDisclosureGroup.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import SwiftUI

struct SubCategoryDisclosureGroup: View {
    var subCategory: SubCategory
    
    var body: some View {
        DisclosureGroup {
            MovieListView(movies: subCategory.movies)
        } label: {
            Text(subCategory.item)
        }
    }
}
/*
#Preview {
    SubCategoryDisclosureGroup()
}*/
