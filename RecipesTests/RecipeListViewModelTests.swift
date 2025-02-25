//
//  RecipeListViewModelTests.swift
//  Recipes
//
//  Created by Ethan Franciliso on 2/25/25.
//

import XCTest
@testable import Recipes

final class RecipeListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmptyRecipes() async {
        let recipelistViewModel = RecipeListViewModel()
        InjectedValues[\.urlPathProvider] = URLEmptyRecipesPathProvider()
        let expectation = XCTestExpectation(description: "Download empty JSON data asynchronously.")
        
        await recipelistViewModel.getRecipes()
        wait(for: [expectation], timeout: 3.0)
        expectation.fulfill()
        
        XCTAssertEqual(recipelistViewModel.recipes.count, 0)
        XCTAssertEqual(recipelistViewModel.dataIsMalformed, false)
    }
    
    func testMalformedData() async {
        let recipelistViewModel = RecipeListViewModel()
        InjectedValues[\.urlPathProvider] = URLMalformedRecipesPathProvider()
        let expectation = XCTestExpectation(description: "Download malformed JSON data asynchronously.")
        
        await recipelistViewModel.getRecipes()
        wait(for: [expectation], timeout: 3.0)
        expectation.fulfill()
        
        XCTAssertEqual(recipelistViewModel.recipes.count, 0)
        XCTAssertEqual(recipelistViewModel.dataIsMalformed, true)
    }
    
    func testGoodData() async {
        let recipelistViewModel = RecipeListViewModel()
        InjectedValues[\.urlPathProvider] = URLAllRecipesPathProvider()
        let expectation = XCTestExpectation(description: "Download JSON data asynchronously.")
        
        await recipelistViewModel.getRecipes()
        wait(for: [expectation], timeout: 3.0)
        expectation.fulfill()
        
        XCTAssertEqual(recipelistViewModel.recipes.count, 63)
        XCTAssertEqual(recipelistViewModel.dataIsMalformed, false)
    }

}
