//
//  APICallController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class APICallController {
    
    func sendRequest() {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         BambooHR JSON (GET https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory)
         */
        
        guard var URL = NSURL(string: "https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory") else {return}
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        
        // Headers
        
        request.addValue("Basic MjBjMDJlYTljZGUwYzMwZjBkMTU1NDNiODBmZDk5ZGNhYWRjODc2NToqKioqKiBIaWRkZW4gY3JlZGVudGlhbHMgKioqKio=", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        /* Start a new Task */
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
    }
}