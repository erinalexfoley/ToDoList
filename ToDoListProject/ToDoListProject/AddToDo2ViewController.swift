//
//  AddToDoViewController.swift
//  ToDoListProject
//
//  Created by Erin Foley on 8/10/20.
//  Copyright © 2020 Erin Foley. All rights reserved.
//

import UIKit

class AddToDo2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // new object of the ToDoClass - drawing from our other file
               let newToDo = ToDoClass()
               
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

    }
    
   
    
    var previousToDoTVC = ToDoTableViewController()
   
    @IBOutlet weak var switchInput: UISwitch!
    
    
    @IBOutlet weak var descriptionInput: UITextField!
    
}
