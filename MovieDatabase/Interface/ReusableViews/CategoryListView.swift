//
//  CategoryListView.swift
//  MovieDatabase
//
//  Created by Sourav on 30/06/24.
//

import SwiftUI

struct CategoryListView: View {
    var categories: [Category]
    var body: some View {
        List(categories, id: \.type) { row in
            
            if row.type == .allMovies, let subCategory = row.subCategories.first {
                NavigationLink(value: subCategory) {
                    Text("All Movies")
                }
            } else {
                DisclosureGroup {
                    
                    ForEach(row.subCategories) { subCategory in
                        SubCategoryDisclosureGroup(subCategory: subCategory)
                    }
                } label: {
                    Text(row.type.rawValue)
                }
            }
        }
    }
}

#Preview {
    CategoryListView(categories: [Category(type: .actors, subCategories: [SubCategory(item: "ShahRukh", movies: [Movie(title: "Hlloo", genre: "ycnc", year: "1234", actors: "dsccs", director: "bgfb")])])])
}
