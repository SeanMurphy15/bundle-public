//
//  LocalDataController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/18/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


class LocalDataController{

    static let sharedInstance = LocalDataController()

    var selectedCells = [String]()


    static func deleteAllLocalData(){

        let bundle = NSBundle.mainBundle().bundleIdentifier!

        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(bundle)
    }

    static func deleteLocalObject(key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(key)
    }

    // MARK: - OBJECT PERSISTENCE


    static func saveLocalObject(value: AnyObject?, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
    }


    static func loadLocalObject(key: String) -> AnyObject?{

        let defaults = NSUserDefaults.standardUserDefaults()
        if let object = defaults.objectForKey(key){
             return object

        } else {

            return nil
        }
    }


    // MARK: - ARRAY PERSISTENCE


    static func saveLocalArray(array: [String], key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(array, forKey: key)
    }


    static func loadLocalArray(key: String) -> [String]{

        let defaults = NSUserDefaults.standardUserDefaults()
        if let array = defaults.objectForKey(key){

            return (array as! [String])

        } else {

            return []
        }
    }



    // MARK: - STRING PERSISTENCE

    static func saveLocalString(value: String, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
    }


    static func loadLocalString(key: String) -> String?{

        let defaults = NSUserDefaults.standardUserDefaults()
        if let object = defaults.stringForKey(key){
            return object

        } else {

            return nil
        }
    }

    // MARK: - BOOL PERSISTENCE


    static func saveLocalBool(value: Bool, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(value, forKey: key)
    }


    static func loadLocalBool(key: String) -> Bool{

        let defaults = NSUserDefaults.standardUserDefaults()
        let object = defaults.boolForKey(key)
        return object
    }

    // MARK: - INT PERSISTENCE


    static func saveLocalInt(value: Int, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(value, forKey: key)
    }


    static func loadLocalInt(key: String) -> Int?{

        let defaults = NSUserDefaults.standardUserDefaults()
        let object = defaults.integerForKey(key)
            return object
    }


    // MARK: - DOUBLE PERSISTENCE


    static func saveLocalDouble(value: Double, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(value, forKey: key)
    }


    static func loadLocalDouble(key: String) -> Double?{

        let defaults = NSUserDefaults.standardUserDefaults()
        let object = defaults.doubleForKey(key)
        return object


    }

    // MARK: - FLOAT PERSISTENCE


    static func saveLocalFloat(value: Float, key: String){

        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(value, forKey: key)
    }


    static func loadLocalFloat(key: String) -> Float?{

        let defaults = NSUserDefaults.standardUserDefaults()
        let object = defaults.floatForKey(key)
        return object
        
        
    }

}