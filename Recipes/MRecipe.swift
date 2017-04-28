//
//  MRecipe.swift
//  Recipes
//
//  Created by Jose Luis on 4/24/17.
//  Copyright © 2017 rdz_gall. All rights reserved.
//

import Foundation
import UIKit

class MRecipe: NSObject{
	var name:String!
	var image: UIImage!
	var time: Int!
	var ingredientes: [String]!
	var steps: [String]!
	
	var isFavourite: Bool=false
	
	

init(name:String,image:UIImage,time:Int, ingredients:[String],steps:[String]){
		self.name=name
		self.image=image
		self.time=time
		self.ingredientes=ingredients
		self.steps=steps
		
	}
	
	init(name:String,image:UIImage){
		self.name=name
		self.image=image
	
		
	}

}
