//
//  ResourceController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/13/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps


class ResourceController {

    static func currentDate() -> String{

        let date:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let currentDate = dateFormatter.stringFromDate(date)

        return currentDate
    }

	static func currentTime() -> String{

		let date:NSDate = NSDate()
		let dateFormatter:NSDateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "h:mm:aa"
		let currentDate = dateFormatter.stringFromDate(date)

		return currentDate
	}

    static func compareDates(date: NSDate, otherDate: NSDate) -> Bool{

        switch date.compare(otherDate) {
        case .OrderedDescending:
            return true
        case .OrderedAscending:
            return false
        case .OrderedSame:
            return false
        }
    }

    static func getIPAddresses(){


    }

    
    
}


