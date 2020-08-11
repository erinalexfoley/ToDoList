//
//  AddToDoViewController.swift
//  ToDoListProject
//
//  Created by Erin Foley on 8/10/20.
//  Copyright © 2020 Erin Foley. All rights reserved.
//

import UIKit
import CoreData

class AddToDo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
    //create a new ToDo Core Data Object to pass in an entity and a managed object context
        
        //this line creates a reference that allows us access to the Core Data. It uses functions
        // prewritten and stores in AppDelegate.swift. We use guard let to conditional to unwrap the Core Data.
        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //this line stores the information from Core Data into the object (dataFromCoreData) that we can access.
        let dataFromCoreData = accessToCoreData.persistentContainer.viewContext
        
        //this line creates an empty object that is the same data type as the ToDoCD entry within Core Data.
        // new object of the ToDoClass - drawing from our other file
        let newToDo = ToDoCD(context: dataFromCoreData)
        
        //these lines give the object information from the user input
        newToDo.descriptionInCD = descriptionInput.text
        newToDo.importantInCD = switchInput.isOn
        
        //this is like clicking 'save'! Our new object is now safe in Core Data!
        accessToCoreData.saveContext()
        
        //this sends the user back to the TVC:
         navigationController?.popViewController(animated: true)
        
        /* ITERATION 1
 
 //use the values from the input field and the importance status and store into the appropriate parameters of the new ToDo object
               if let checkForInput = descriptionInput.text {
               newToDo.description = checkForInput
               newToDo.important = switchInput.isOn
               }
               
               //add the new ToDo to the array and update/reload the TableView
               previousToDoTVC.listOfToDo.append(newToDo)
               previousToDoTVC.tableView.reloadData()
               
               //check if the ViewController is embedded in a Navigation Controller
               //then "pop", or go back to the previous ViewController
               //it will do so through a smooth animation
               navigationController?.popViewController(animated: true)
 
 */

    }
    
   
    
    var previousToDoTVC = ToDoTableViewController()
   
    @IBOutlet weak var switchInput: UISwitch!
    
    
    @IBOutlet weak var descriptionInput: UITextField!
    
}
