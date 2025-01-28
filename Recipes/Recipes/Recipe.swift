//
//  Recipe.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import Foundation

struct Recipe: Identifiable {
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let id = UUID()
    let source_url: String?
    let youtube_url: String?
}
