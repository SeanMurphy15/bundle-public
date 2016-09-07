//
//  ConversionController.swift
//  Bundle
//
//  Created by Sean Murphy on 5/4/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation

class ConversionController{

    static func convertStringToFloat(string: String) -> Float?{

        let string = string.stringByReplacingOccurrencesOfString("$", withString: "")

        if let floatToString = NSNumberFormatter().numberFromString(string)?.floatValue{

            return floatToString

        } else {

            return nil
        }
    }

    static func convertStringToInt(string: String) -> Int?{

        let string = string.stringByReplacingOccurrencesOfString("$", withString: "")


        if let intToString = NSNumberFormatter().numberFromString(string)?.integerValue{

            return intToString

        } else {

            return nil
        }
    }

    static func convertStringToDouble(string: String) -> Double?{

       let string = string.stringByReplacingOccurrencesOfString("$", withString: "")

        if let doubleToString = NSNumberFormatter().numberFromString(string)?.doubleValue{

            return doubleToString

        } else {

            return nil
        }

    }

    static func convertStringToNSDate(string: String) -> NSDate?{

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.dateFromString(string)

        return date
    }

    static func convertIntToString(int: Int) -> String?{

        if let intToString = NSNumberFormatter().stringFromNumber(int){

            return intToString

        } else {

            return nil

        }

    }

	}