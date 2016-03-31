//
//  PhotoAndNameViewController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import UIKit

class PhotoAndNameViewController: UIViewController {
    

    // Click the image and it displays the name
    @IBAction func employeeImageButtonClicked(sender: AnyObject) {
        
    
    }
    
    @IBOutlet weak var EmployeeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
