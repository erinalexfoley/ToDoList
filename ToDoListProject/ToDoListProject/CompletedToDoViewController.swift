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
        
        toDoDisplay.text = selectedToDo?.descriptionInCD // the question mark after
                                                         // selectedToDo will tell our code "if there is a selectedToDo, we'll go ahead and pass it the info it needs, otherwise, we'll set it equal to nil".
    }
    

    @IBAction func completeButtonTapped(_ sender: UIButton) {
        //delete a selected ToDo from Core Data
        guard let accessToCoreData =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let dataFromCoreData = accessToCoreData.persistentContainer.viewContext
        
        if let toDo2Delete = selectedToDo {
            dataFromCoreData.delete(toDo2Delete)
            navigationController?.popViewController(animated: true)
        }
    }
    
    //reference the (previous) ToDoTableViewController by creating the following objects
    
    var previousToDoTVC = ToDoTableViewController()
    
    var selectedToDo : ToDoCD? // the question mark indicates that
                               // that the object will be Core Data ToDo data ty[e or nil
    
    
}
