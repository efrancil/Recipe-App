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
        // Do any additional setup after loading the view.
        
        recipeListViewModel.getRecipes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

