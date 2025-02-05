//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Ethan Franciliso on 2/4/25.
//

import Foundation
import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    var label: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        layoutUI()
        
    }
    
    private func setupUI() {
    }
    
    private func layoutUI() {
        self.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor), label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)])
        
    }
}
