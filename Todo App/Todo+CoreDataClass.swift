//
//  Todo+CoreDataClass.swift
//  Todo App
//
//  Created by Hayden Haddock on 12/1/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Todo)
public class Todo: NSManagedObject {
    
    
    convenience init?(name: String?, desc: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Todo.entity(), insertInto: managedContext)
        self.name = name;
        self.desc = desc;
    }
}
