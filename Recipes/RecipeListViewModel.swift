//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import Foundation

// In < iOS 17 we need to conform to ObservableObject while also marking
// these properties with @Published
@Observable
final class RecipeListViewModel {
    
    private enum Constants {
        static let urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    }
    
    private(set) var recipes: [Recipe] = []
    private(set) var isLoading: Bool = true
    private(set) var dataIsMalformed: Bool = false
    
    init(recipes: [Recipe] = []) {
        self.recipes = recipes
    }
    
    func getRecipes() async {
        if let url: URL = URL(string: Constants.urlString) {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    print("Invalid status code")
                    return
                }
                
                guard (200...299).contains(statusCode) else {
                    print("Invalid status code: \(statusCode)")
                    return
                }
            
                print("Data received: \(data)")
                let decoder = JSONDecoder()
                if let decodedRecipes: Recipes = try? decoder.decode(Recipes.self, from: data) {
                    self.recipes = decodedRecipes.recipes
                    self.isLoading = false
                } else {
                    self.isLoading = false
                    self.dataIsMalformed = true
                    print("Malformed data")
                }
                
            } catch let error {
                print("Error occured when calling API endpoint: \(error)")
            }
                
        }
    }
    
}
