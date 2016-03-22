//
//  BambooApi.swift
//  WhoIsWho
//
//  Created by Alexander on 3/19/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

func fetchDataFromBamboo (){
    
    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    let request = NSURLRequest(URL: NSURL(string: "https://api.bamboohr.com/api/gateway.php/abateman/")!)
    
    let task: NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
        if let data = data {
            let response = NSString(data: data, encoding: NSUTF8StringEncoding)
            print(response)
        }
    }
    
    task.resume()
}
