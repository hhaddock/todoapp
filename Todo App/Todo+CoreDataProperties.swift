//
//  Todo+CoreDataProperties.swift
//  Todo App
//
//  Created by Hayden Haddock on 12/1/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?

}
