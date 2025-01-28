//
//  RecipeListView.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import SwiftUI

struct RecipeListView: View {
    @State var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        if recipeListViewModel.recipes.isEmpty {
            Text("No recipes are available")
                .font(.headline)
        } else {
            List {
                ForEach(recipeListViewModel.recipes) { recipe in
                    RecipeView(recipe: recipe)
                }
            }
        }
    }
}

#Preview {
    RecipeListView(recipeListViewModel: RecipeListViewModel(recipes: [Recipe(cuisine: "Italian", name: "Pasta", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil), Recipe(cuisine: "Chinese", name: "Orange Chicken", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil), Recipe(cuisine: "Filipino", name: "Adobo", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil)]))
}
