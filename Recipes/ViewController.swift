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
        
        recipeListViewModel.recipes = [Recipe(cuisine: "Italian", name: "Pasta", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil), Recipe(cuisine: "Chinese", name: "Orange Chicken", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil), Recipe(cuisine: "Filipino", name: "Adobo", photo_url_large: nil, photo_url_small: nil, source_url: nil, youtube_url: nil)]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

