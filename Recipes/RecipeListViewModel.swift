//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import Foundation

@Observable class RecipeListViewModel {
    
    private enum Constants {
        static let urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    }
    
    var recipes: [Recipe] = []
    var isLoading: Bool = true
    var dataIsMalformed: Bool = false
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
    
    func getRecipes(completionHandler: @escaping () -> Void) {
        if let url: URL = URL(string: Constants.urlString) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                
                guard let self else { return }
                
                if let error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    print("Data received: \(data)")
                    let decoder = JSONDecoder()
                    if let decodedRecipes: Recipes = try? decoder.decode(Recipes.self, from: data) {
                        self.recipes = decodedRecipes.recipes
                        self.isLoading = false
                        completionHandler()
                    } else {
                        self.isLoading = false
                        self.dataIsMalformed = true
                        print("Malformed data")
                    }
                }
            }
            task.resume()
        }
    }
    
}
