//
//  Employee.swift
//  WhoIsWho
//
//  Created by Alexander on 3/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class Employee {
    
    
    static let imageKey = "photoURL"
    static let nameKey = "displayName"
    
    var photoURL = ""
    var displayName = ""

    
    init(jsonDictionary: [String : AnyObject]) {
        
        if let photoURL = jsonDictionary[Employee.imageKey] as? String {
            self.photoURL = photoURL
        }
        
        if let displayName = jsonDictionary[Employee.nameKey] as? String {
            self.displayName = displayName
        }
    }

}
