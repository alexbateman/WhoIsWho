//
//  APICallController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class APIController {
    
    func fetchDataFromBamboo (){
        
        let stringURL = "https://api.bamboohr.com/api/gateway.php/company/application/json"
        let url = NSURL(string: stringURL)
        
        let data = NSURLSession.sharedSession()
    }
    
}