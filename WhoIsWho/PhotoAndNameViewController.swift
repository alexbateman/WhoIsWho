//
//  PhotoAndNameViewController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import UIKit

class PhotoAndNameViewController: UIViewController {
    
    func emptyText() {
        
    }
    
    var person: Employee? {
        didSet {
            
            nameLabel.hidden = true
        }
    }
    
    var employeeController = EmployeeController()
    // Employee contains the image, id, and the name of the employee
    var currentEmployee: Employee? {
        didSet {
            nameLabel.hidden = true

            guard let currentEmployee = currentEmployee else { return }
            nameLabel.text = currentEmployee.displayName
            employeeController.getEmployeeImage(currentEmployee) { (image, error) in
                if let image = image where error == nil {
                    self.imageView.image = image
                } else {
                    print("Error getting employee image: \(error)")
                }
            }
        }
    }

    @IBAction func employeeImageButtonClicked(sender: AnyObject) {
        
        if nameLabel.hidden {
            nameLabel.hidden = false

        } else {
            currentEmployee = employeeController.nextEmployee()

        }
        
//        currentEmployee = employeeController.nextEmployee()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        AppearanceController.initalizeAppearance()
        imageButton.imageView?.contentMode = .ScaleAspectFit
        
        employeeController.getEmployees { (success, error) in
            if success && error == nil {
                self.currentEmployee = self.employeeController.nextEmployee()
            } else {
                print("Error getting employees: \(error)")
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
