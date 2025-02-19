//
//  RecipeListView.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var recipeListViewModel: RecipeListViewModel
    
    var body: some View {
        if recipeListViewModel.dataIsMalformed {
            Text("There was an error retrieving the recipes. Please try again later")
                .font(.headline)
        }
        else if recipeListViewModel.recipes.isEmpty {
            Text("No recipes are available")
                .font(.headline)
        } else {
            List {
                ForEach(recipeListViewModel.recipes) { recipe in
                    RecipeView(recipe: recipe)
                }
            }
            .redacted(reason: recipeListViewModel.isLoading ? .placeholder : [])
        }
    }
}

#Preview {
    RecipeListView(recipeListViewModel: RecipeListViewModel(recipes: [Recipe(cuisine: "Italian", name: "Pasta", photoURLLarge: nil, photoURLSmall: nil, uuid: "1", sourceURL: nil, youtubeURL: nil), Recipe(cuisine: "Chinese", name: "Orange Chicken", photoURLLarge: nil, photoURLSmall: nil, uuid: "2", sourceURL: nil, youtubeURL: nil), Recipe(cuisine: "Filipino", name: "Adobo", photoURLLarge: nil, photoURLSmall: nil, uuid: "3", sourceURL: nil, youtubeURL: nil)]))
}
