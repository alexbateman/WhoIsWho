//
//  APICallController.swift
//  WhoIsWho
//
//  Created by Alexander on 3/12/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class BambooCall {
    
    private static let API_KEY = "20c02ea9cde0c30f0d15543b80fd99dcaadc8765"
    static let baseURL = "https://api.bamboohr.com/api/gateway.php/abateman/v1/employees/directory"
    
    static func searchURLByCity(city: String) -> NSURL {
        let escapedCityString = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: baseURL + "?q=\(escapedCityString!)" + "&appid=\(API_KEY)")!
    }
    
    static func urlForIcon(iconString: String) -> NSURL {
        return NSURL(string: "http://openweathermap.org/img/w/\(iconString).png")!
    }
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
}