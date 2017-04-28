//
//  DetailViewController.swift
//  Recipes
//
//  Created by Jose Luis on 4/25/17.
//  Copyright © 2017 rdz_gall. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	
	@IBOutlet var recipeImageView: UIImageView!
	
	
	@IBOutlet var recipeTitle: UILabel!
	
	var recipe:MRecipe!
	
	@IBOutlet var tableView: UITableView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.recipeImageView.image=self.recipe.image
		self.recipeTitle.text=recipe.name
		
		//asignar los delegados de tableview a la viewcontroller
		self.tableView.dataSource=self
		self.tableView.delegate=self
		

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension DetailViewController:UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		switch section {
		case 0:
			return 2
		case 1:
			return self.recipe.ingredientes.count
		case 2:
			return self.recipe.steps.count
		default:
			return 0
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
		
		cell.backgroundColor = UIColor.clear
		
		switch indexPath.section {
		case 0:
			switch indexPath.row {
			case 0:
				cell.keyLabel.text = "Nombre:"
				cell.valueLabel.text = self.recipe.name
			case 1:
				cell.keyLabel.text = "Tiempo:"
				cell.valueLabel.text = "\(self.recipe.time!) min"
				/*case 2:
				cell.keyLabel.text = "Favorita: "
				if self.recipe.isFavourite {
				cell.valueLabel.text = "Si"
				} else {
				cell.valueLabel.text = "No"
				}*/
			default:
				break
			}
			
		case 1:
			if indexPath.row == 0 {
				cell.keyLabel.text = "Ingredientes:"
			} else {
				cell.keyLabel.text = ""
			}
			cell.valueLabel.text = self.recipe.ingredientes[indexPath.row]
		case 2:
			if indexPath.row == 0 {
				cell.keyLabel.text = "Pasos:"
			} else {
				cell.keyLabel.text = ""
			}
			cell.valueLabel.text = self.recipe.steps[indexPath.row]
		default:
			break
		}
		
		
		return cell
		
	}
	
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		var title = ""
		
		switch section {
		case 1:
			title = "Ingredientes"
		case 2:
			title = "Pasos"
		default:
			break
		}
		
		return title
	}
}


extension DetailViewController:UITableViewDelegate{

}








