//
//  CompletedToDoViewController.swift
//  ToDoListProject
//
//  Created by Erin Foley on 8/10/20.
//  Copyright © 2020 Erin Foley. All rights reserved.
//

import UIKit

class CompletedToDoViewController: UIViewController {

    @IBOutlet weak var toDoDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //make sure tht the ToDo text is getting to the CompleteToDoViewController
        
        toDoDisplay.text = selectedToDo.description
    }
    

    @IBAction func completeButtonTapped(_ sender: UIButton) {
    }
    
    //reference the (previous) ToDoTableViewController by creating the following objects
    
    var previousToDoTVC = ToDoTableViewController()
    
    var selectedToDo = ToDoClass()
    
}
