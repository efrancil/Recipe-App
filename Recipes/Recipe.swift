//
//  Recipe.swift
//  Recipes
//
//  Created by Ethan Franciliso on 1/27/25.
//

import Foundation

struct Recipes: Codable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Codable {
    let cuisine: String
    let name: String
    let photoURLLarge: URL?
    let photoURLSmall: URL?
    let uuid: String
    let sourceURL: URL?
    let youtubeURL: URL?
    let id = UUID()
    
    private enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case uuid
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}
