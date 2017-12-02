//
//  TodosViewController.swift
//  Todo App
//
//  Created by Hayden Haddock on 12/1/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//

import UIKit
import CoreData

class TodosViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    var todos = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        do {
            todos = try managedContext.fetch(fetchRequest)
            todoTableView.reloadData()
            print(todos);
        }
        catch {
            print("Fetch was not completed")
        }
        
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

extension TodosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath)
        
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.name
        cell.detailTextLabel?.text = todo.desc
        return cell
    }
}
