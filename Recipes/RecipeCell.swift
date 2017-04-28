//
//  RecipeCell.swift
//  Recipes
//
//  Created by Jose Luis on 4/25/17.
//  Copyright © 2017 rdz_gall. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
	
	
	@IBOutlet var ThumbRecipe: UIImageView!
	
	@IBOutlet var recipeTitle: UILabel!
	@IBOutlet var recipeFieldTwo: UILabel!
	@IBOutlet var recipeFieldThree: UILabel!
	
	
	
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
