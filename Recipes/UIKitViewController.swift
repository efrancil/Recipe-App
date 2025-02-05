//
//  UIKitViewController.swift
//  Recipes
//
//  Created by Ethan Franciliso on 2/4/25.
//

import Foundation
import UIKit

class UIKitViewController: UIViewController {
    
    private enum Constants {
        static let cellIdentifier: String = "recipe-cell"
    }
    
    private var recipeListViewModel: RecipeListViewModel = .init()
    private var recipeTableView: UITableView! = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutUI()
        recipeListViewModel.getRecipes() { [weak self] in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.recipeTableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupUI() {
        recipeTableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        recipeTableView.dataSource = self
        recipeTableView.delegate = self
    }
    
    private func layoutUI() {
        self.view.addSubview(self.recipeTableView)
        self.recipeTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([self.recipeTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor), self.recipeTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor), self.recipeTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor), self.recipeTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)])

    }
}

extension UIKitViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeListViewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! RecipeTableViewCell
        cell.label.text = recipeListViewModel.recipes[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
