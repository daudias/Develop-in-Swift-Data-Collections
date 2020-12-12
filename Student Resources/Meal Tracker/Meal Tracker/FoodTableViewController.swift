//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Dias on 12/13/20.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal]  {
        let breakfast = Meal(name: "breakfast", food: [Food(name: "Fruits", description: "Apples, bananas and oranges"), Food(name: "Juice", description: "Juice from garlic"), Food(name: "Salad", description: "Salad from green")])
        let lunch = Meal(name: "lunch", food: [Food(name: "Grechka", description: "Zharennaya grechka s oboshyami"), Food(name: "Fasolevyi sup", description: "Fasolvyi sup s chesnokom i paprikoi"), Food(name: "Kotlety iz nuta", description: "Zharennyi kotletsy iz nuta so speciyami")])
        let dinner = Meal(name: "dinner", food: [Food(name: "Vegan Cake", description: "Chocolate vegan cake"), Food(name: "Humus", description: "Classical humus"), Food(name: "Fresh salad", description: "Fresh salad with tomatoes")])
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let food = meals[indexPath.section].food[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
