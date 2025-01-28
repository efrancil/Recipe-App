//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import Foundation

@Observable class RecipeListViewModel {
    
    var recipes: [Recipe] = []
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
}
