//
//  BambooApi.swift
//  WhoIsWho
//
//  Created by Alexander on 3/19/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

func fetchDataFromBamboo(){
    
    let url = NSURL(string: "https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory")!
    
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    
    config.HTTPAdditionalHeaders = [
        "Accept": "application/json",
        "API Key": "20c02ea9cde0c30f0d15543b80fd99dcaadc8765"
    ]
    
    let urlSession = NSURLSession(configuration: config)
    
    let myQuery = urlSession.dataTaskWithURL(url, completionHandler: {
        data, response, error -> Void in
        /* ... */
    })
    myQuery.resume()

}
