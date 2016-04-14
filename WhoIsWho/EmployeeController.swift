//
//  EmployeeController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import UIKit

class EmployeeController {
    
    var apiCallController = APICallController()
    private(set) var employees = [Employee]()
    
    private var currentIndex = 0
    
    static let employeesKey = "employees"
    
    // This parses the employees in an array.
    func getEmployees(completion: (success: Bool, error: NSError?) -> Void) {
        let endpoint = "https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory"
        apiCallController.getObjects(endpoint) { (json, error) in
            if let json = json where error == nil {
                guard let employeesArray = json[EmployeeController.employeesKey] as? [[String: AnyObject]] else { completion(success: false, error: nil); return }
                let employees = employeesArray.flatMap { Employee(jsonDictionary: $0) }
                
                // This will pass anyone without an image
                let placeholderPath = "https://abateman.bamboohr.com/images/photo_placeholder.gif"
                let filteredEmployees = employees.filter { $0.photoURLPath != placeholderPath }
                self.employees = filteredEmployees
                completion(success: true, error: nil)
            } else {
                completion(success: false, error: error)
            }
        }
    }
    
    // This iterates if there is an employee in the queue. It then allows the next image once the first has been selected.
    func nextEmployee() -> Employee? {
        guard employees.count > 0 else { return nil }
        let index = currentIndex
        if index >= employees.count {
            currentIndex = 0
            return employees.first
        }
        currentIndex += 1
        return employees[index]
    }
    
    // This code makes the image data readable
    func getEmployeeImage(employee: Employee, completion:(image: UIImage?, error: NSError?) -> Void) {
        apiCallController.getData(employee.photoURLPath) { (data, error) in
            if let data = data, image = UIImage(data: data) where error == nil {
                completion(image: image, error: nil)
            } else {
                completion(image: nil, error: error)
            }
        }
    }
    
}