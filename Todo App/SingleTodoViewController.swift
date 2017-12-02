//
//  SingleTodoViewController.swift
//  Todo App
//
//  Created by Hayden Haddock on 12/1/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit

class SingleTodoViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTodo(_ sender: Any) {
        let name = nameTextField.text
        let desc = descTextField.text
        
        if let todo = Todo(name: name, desc: desc){
            do {
                let managedContext = todo.managedObjectContext;
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true);
            }
            catch {
                print("Context couldnt be saved")
            }
        }
        
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
