//
//  PostalAddress.swift
//  Bundle
//
//  Created by Sean Murphy on 4/27/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


class PostalAddress{

    var id : Int
    var firstName : String
    var lastName : String
    var name : String
    var streetNumber : String
    var street : String
    var unit : String
    var city : String
    var state : String
    var postalCode : String
    var country : String
    var longitude : Double
    var latitude : Double

    init?(id:Int, firstName: String, lastName : String, name : String, streetNumber : String, street : String, unit : String, city : String, state : String, postalCode : String, country : String, longitude : Double, latitude : Double){

        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.name = name
        self.streetNumber = streetNumber
        self.street = street
        self.unit = unit
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
        self.longitude = longitude
        self.latitude = latitude

    }

}