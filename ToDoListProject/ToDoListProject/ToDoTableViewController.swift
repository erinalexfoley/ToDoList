//
//  ToDoTableViewController.swift
//  ToDoListProject
//
//  Created by Erin Foley on 8/10/20.
//  Copyright © 2020 Erin Foley. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    
    var listOfToDo : [ToDoClass] = []
    
    func createToDo() -> [ToDoClass] {
        
        let apushEssayToDo = ToDoClass()
        apushEssayToDo.description = "APUSH essay"
        apushEssayToDo.important = true
        
        let apushNotesToTake = ToDoClass()
        apushNotesToTake.description = "Take notes on Chapter 2"
        
        return [apushEssayToDo, apushNotesToTake]
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfToDo = createToDo()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        //each list item will be filled with a to-do item and the cell's label will be set to its description
        
        let eachToDo = listOfToDo[indexPath.row]
        cell.textLabel?.text = eachToDo.description
        //if a to-do item has its important variable set to "true", it will appear red
        if eachToDo.important {
            cell.textLabel?.text =  eachToDo.description
            cell.textLabel?.textColor = UIColor.red
            
        } else {
            cell.textLabel?.text = eachToDo.description
        }

        return cell
    }
   
//this function will be called right after the user taps the "+" icon, but before the segue is actually performed.
/* Once the user triggers a segue, it will check the destination.
If the destination for this segue is the AddToDoViewController, then the properties of previousToDoTVC  are assigned to the destination.
The value of those properties is the ToDoTableViewController, (or the current ViewController).
This allows the two ViewControllers to know about each other!
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as?
            AddToDo2ViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
            if let chosenToDo = sender as? ToDoClass {
                nextCompletedToDoVC.selectedToDo = chosenToDo
                nextCompletedToDoVC.previousToDoTVC = self
            }
        }
    }
    
/*determine which ToDo row was tapped using listOfToDo[indexPath.row]
give instructions to perform the segue with the additional information that is contained within (the identifier) “moveToCompletedToDoVC”
*/

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //this gives us a single ToDo
        
        let eachToDo = listOfToDo[indexPath.row]
        
        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
    }
}
