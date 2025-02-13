//
//  ViewController.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import UIKit
import SwiftUI

class ViewController: UIHostingController<RecipeListView> {
    
    private var recipeListViewModel: RecipeListViewModel = .init()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: RecipeListView(recipeListViewModel: recipeListViewModel))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a concurrent environment since viewDidLoad() is a non-concurrent method
        Task {
            await recipeListViewModel.getRecipes() {}
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
