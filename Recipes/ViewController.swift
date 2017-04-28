//
//  ViewController.swift
//  Recipes
//
//  Created by Jose Luis on 4/24/17.
//  Copyright © 2017 rdz_gall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	
	var recipes: [MRecipe]=[]

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//asignar los delegados de tableview a la viewcontroller
		self.tableView.dataSource=self
		self.tableView.delegate=self
		
		inicializarCompleto()
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override var prefersStatusBarHidden : Bool {
		return true
	}
	
	
	/*
	 override func prefersStatusBarHidden()-> Bool{
		return true
	}*/
	
	func inicializarRecetas(){
		recipes.append(MRecipe(name: "Tortilla de patatas",image:#imageLiteral(resourceName: "hamburguesa")))
		
		recipes.append(MRecipe(name: "Pizza Hawaiana",image:#imageLiteral(resourceName: "hamburguesa")))
		recipes.append(MRecipe(name: "Sopa Tarasca",image:#imageLiteral(resourceName: "Langosta")))
		recipes.append(MRecipe(name: "Hamburguesa de queso",image:#imageLiteral(resourceName: "hamburguesa")))
		recipes.append(MRecipe(name: "Mariguana",image:#imageLiteral(resourceName: "ensalada")))
		recipes.append(MRecipe(name: "Pastel de platano",image:#imageLiteral(resourceName: "hamburguesa")))
		
		
	}
	
	
	func inicializarCompleto(){
		recipes.append(MRecipe(name: "Tortilla de patatas",image:#imageLiteral(resourceName: "hamburguesa"),
			time:20,
			ingredients:["Tortilla","pattas","agua"],
			steps:["cortar tortillas","perlar patatas","hervir el agua"]))
	
		recipes.append(MRecipe(name: "Pizza Hawaiana",image:#imageLiteral(resourceName: "hamburguesa"),
		                       time:30,
		                       ingredients:["hariana","huevos","mantequilla"],
		                       steps:["horno caliente","amazar","ingredentar"]))
 
		recipes.append(MRecipe(name: "Sopa Tarasca",image:#imageLiteral(resourceName: "Langosta"),
		                       time:20,
		                       ingredients:["frijoles","hoja aguacate","tortillas"],
		                       steps:["hacer la salda","freir tortillas","hehcar creama"]))

		recipes.append(MRecipe(name: "Hamburguesa de queso",image:#imageLiteral(resourceName: "hamburguesa"),
		                       time:24,
		                       ingredients:["pan","carne","catsup"],
		                       steps:["freir carne","hechar mayonesa","hechar chile"]))

	 
		recipes.append(MRecipe(name: "Pastel de platano",image:#imageLiteral(resourceName: "hamburguesa"),
		                       time:202,
		                       ingredients:["huevo","harina","platano"],
		                       steps:["amazar","hornear","comer"]))

	
	
	
	}
	
	
}



/*
extension ViewController : UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.recipes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let recipe = recipes[indexPath.row]
		let cellID = "RecipeCell"
		
		let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
		//as! FullRecipeCell
		//cell.recipeImageView.image = recipe.image
		
		cell.imageView?.image=recipe.image
		cell.textLabel?.text=recipe.name
		
		return cell

}*/


extension ViewController : UITableViewDataSource {
	
	
	//MARK: UITableViewDataSource
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.recipes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let recipe = recipes[indexPath.row]
		let cellID = "RecipeCell"
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
		
		cell.ThumbRecipe?.image=recipe.image
		cell.recipeTitle?.text=recipe.name
		cell.recipeFieldTwo?.text="\(recipe.time!) min"
		cell.recipeFieldThree?.text="ingredientes: \(recipe.ingredientes.count)"
		
		cell.ThumbRecipe.layer.cornerRadius=32.0
		cell.ThumbRecipe.layer.masksToBounds=true
		
		if recipe.isFavourite{
			cell.accessoryType = .checkmark
		}else{
			cell.accessoryType = .none
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete {
			
			self.recipes.remove(at: indexPath.row)
			
		}
		
		self.tableView.deleteRows(at: [indexPath], with: .fade)
		
	}
	
	
	
	 func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		
		//Compartir
		let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
			
			let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10 con Juan Gabriel"
			
			let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
			self.present(activityController, animated: true, completion: nil)
		}
		
		shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
		
		//Borrar
		let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
			self.recipes.remove(at: indexPath.row)
			self.tableView.deleteRows(at: [indexPath], with: .fade)
		}
		
		deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
		
		return [shareAction, deleteAction]
	}

	
	
	
}


extension ViewController: UITableViewDelegate{

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("he seleciconado la fina \(indexPath.row)")
		
		let recipe=self.recipes[indexPath.row]
		let alertController=UIAlertController(title: recipe.name, message:"Valora este plato", preferredStyle: .alert)
		let cancelAction=UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
		
		alertController.addAction(cancelAction)
		
		var favouriteActionTitle="Me gusta"
		var favouriteActionS=UIAlertActionStyle.default
		
		if recipe.isFavourite{
			favouriteActionTitle="No me gusta"
			favouriteActionS=UIAlertActionStyle.destructive
			
		}
		
		
		let favouriteAction=UIAlertAction(title: favouriteActionTitle, style: favouriteActionS) { (action) in
			let recipe=self.recipes[indexPath.row]
			recipe.isFavourite = !recipe.isFavourite
			self.tableView.reloadData()
			
		}
		
		alertController.addAction(favouriteAction)
		
		self.present(alertController,animated:true,completion: nil)
		
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier=="showReciveDetail"{
			if let indexpath=self.tableView.indexPathForSelectedRow{
				let selectedRecipe=self.recipes[indexpath.row]
				let destinationViewController=segue.destination as! DetailViewController
				destinationViewController.recipe=selectedRecipe
				
				
			}
		}
	}
	
	
}






