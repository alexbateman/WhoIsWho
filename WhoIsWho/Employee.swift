//
//  Employee.swift
//  WhoIsWho
//
//  Created by Alexander on 3/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class Employee {
    
    static let imageKey = "photoUrl"
    static let nameKey = "displayName"
    static let idKey = "id"
    
    // Is the photo path supposed to call to the API for the PhotoURL?
    // Is the jsonDictionary supposed to call to the API as well?
    
    // id is the Employee ID
    var id: Int
    var photoURLPath: String
    var displayName: String

    
    init?(jsonDictionary: [String : AnyObject]) {
        guard let photoURL = jsonDictionary[Employee.imageKey] as? String else { return nil }
        self.photoURLPath = photoURL
        
        guard let displayName = jsonDictionary[Employee.nameKey] as? String else { return nil }
        self.displayName = displayName
        
        guard let id = jsonDictionary[Employee.idKey] as? Int else { return nil }
        self.id = id
    }
    
}
