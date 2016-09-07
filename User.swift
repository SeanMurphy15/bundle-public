//
//  User.swift
//  Bundle
//
//  Created by Sean Murphy on 4/20/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation


class User {

    var authToken : String?
    var id : Int
    var email : String
    var imageUrl : String?
    var firstName : String?
    var lastName : String?
    var gender : String?
    var birthDate : String?
    var phoneNumber : String?
    var facebookAccessToken : String?
    var googlePlusAccessToken : String?


    init?(authToken: String, id: Int, email: String, imageUrl: String?, firstName: String?, lastName: String?, gender: String?, birthDate: String?, phoneNumber: String?, facebookAccessToken: String?, googlePlusAccessToken: String?){

        self.authToken = authToken
        self.id = id
        self.email = email
        self.imageUrl = imageUrl
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.phoneNumber = phoneNumber
        self.facebookAccessToken = facebookAccessToken
        self.googlePlusAccessToken = googlePlusAccessToken
    }

    init?(id: Int, email: String, imageUrl: String?, firstName: String?, lastName: String?, gender: String?, birthDate: String?, phoneNumber: String?, facebookAccessToken: String?, googlePlusAccessToken: String?){

        self.id = id
        self.email = email
        self.imageUrl = imageUrl
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.phoneNumber = phoneNumber
        self.facebookAccessToken = facebookAccessToken
        self.googlePlusAccessToken = googlePlusAccessToken
        
        
        
    }
    
    
}