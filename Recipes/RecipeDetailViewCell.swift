//
//  RecipeDetailViewCell.swift
//  Recipes
//
//  Created by Jose Luis on 4/25/17.
//  Copyright © 2017 rdz_gall. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {

	@IBOutlet var keyLabel: UILabel!
	
	@IBOutlet var valueLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
