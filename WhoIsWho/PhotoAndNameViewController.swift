//
//  PhotoAndNameViewController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import UIKit

class PhotoAndNameViewController: UIViewController {
    
    var employeeController = EmployeeController()
    var currentEmployee: Employee? {
        didSet {
            guard let currentEmployee = currentEmployee else { return }
            nameLabel.text = currentEmployee.displayName
            employeeController.getEmployeeImage(currentEmployee) { (image, error) in
                if let image = image where error == nil {
                    self.imageView.image = image
//                    self.imageButton.setImage(image, forState: .Normal)
                } else {
                    print("Error getting employee image: \(error)")
                }
            }
        }
    }

    // Click the image and it displays the name
    // Click again and it displays the next picture without a name
    @IBAction func employeeImageButtonClicked(sender: AnyObject) {
        currentEmployee = employeeController.nextEmployee()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
