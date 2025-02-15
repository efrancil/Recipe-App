//
//  URLPathProviding.swift
//  Recipes
//
//  Created by Ethan Franciliso on 2/15/25.
//

import Foundation

@propertyWrapper struct Injected {
    var wrappedValue: URLPathProviding {
        didSet { wrappedValue = wrappedValue }
    }

    init(wrappedValue: URLPathProviding) {
        self.wrappedValue = wrappedValue
    }
}

protocol URLPathProviding {
    
    var path: String { get }
}

struct URLAllRecipesPathProvider: URLPathProviding {
    
    private enum Constants {
        static let urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    }
    
    var path: String {
        return Constants.urlString
    }
}

struct URLMalformedRecipesPathProvider: URLPathProviding {
    
    private enum Constants {
        static let urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    }
    
    var path: String {
        return Constants.urlString
    }
}

struct URLEmptyRecipesPathProvider: URLPathProviding {
    
    private enum Constants {
        static let urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
    var path: String {
        return Constants.urlString
    }
}
