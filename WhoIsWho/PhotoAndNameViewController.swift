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

    // Click the image and it displays the name
    // Click again and it displays the next picture without a name
    @IBAction func employeeImageButtonClicked(sender: AnyObject) {
       
//        APICallController.getObjects(<#T##APICallController#>)
//         employeeController.getEmployees { (success, error) in
//            <#code#>
//        }
        
    }
    
    @IBOutlet weak var EmployeeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeController.getEmployees { (success, error) in

        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
