//
//  APICallController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class APICallController {
    
//    private static let API_KEY = "20c02ea9cde0c30f0d15543b80fd99dcaadc8765"
//    static let baseURL = "https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory"
    
    func getObjects(endpoint: String, completion: (json: [String: AnyObject]?, error: NSError?) -> Void) {
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        // Create session, and optionally set a NSURLSessionDelegate
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         BambooHR JSON (GET https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory)
         */
        
        guard let URL = NSURL(string: endpoint) else { completion(json: nil, error: nil); return }
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = "GET"
        
        // Headers
        
        request.addValue("Basic MjBjMDJlYTljZGUwYzMwZjBkMTU1NDNiODBmZDk5ZGNhYWRjODc2NToqKioqKiBIaWRkZW4gY3JlZGVudGlhbHMgKioqKio=", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Start a new Task
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                if (error == nil) {
                    // Success
                    let statusCode = (response as! NSHTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    
                    guard let data = data, json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject] else { completion(json: nil, error: nil); return }
                    completion(json: json, error: error)
                }
                else {
                    // Failure
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                    completion(json: nil, error: error)
                }
            }
        })
        task.resume()
    }
    
    func getData(endpoint: String, completion: (data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        guard let url = NSURL(string: endpoint) else { completion(data: nil, error: nil); return }
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {
                completion(data: data, error: error)
            }
        }
        task.resume()
    }
    
}

