//
//  AppearanceController.swift
//  WhoIsWho
//
//  Created by Alexander on 4/10/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation
import UIKit



class AppearanceController {
    
    static func initalizeAppearance() {
        
        //Set colors for entire app.
        UIView.appearance().backgroundColor = UIColor.blueColor()
    }
}

extension UIColor {
    
    class func defaultViewBackgroundColor() -> UIColor {
        return UIColor(red:0.419, green:0.487, blue:0.415, alpha:1.000)
    }
}

