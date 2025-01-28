//
//  RecipeView.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                if let url = recipe.photo_url_small {
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70,
                    height: 70)
                    .cornerRadius(5)
                    .padding(.leading, 8)
                } else {
                    Image("recipe-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70,
                        height: 70)
                        .cornerRadius(5)
                        .padding(.leading, 8)
                }
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    Text(recipe.cuisine)
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    RecipeView(recipe: Recipe(cuisine: "Cuisine", name: "Food", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil))
}
