//
//  ParameterController.swift
//  Bundle
//
//  Created by Sean Murphy on 5/13/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation

class ParameterController{


    //MARK: - PREPARE BUNDLE POST PARAMETERS

    static func prepareBundlePOSTParameters() -> [String:AnyObject]{

        var dataDictionary = [String:AnyObject]()


        if LocalDataController.loadLocalString("bundleEventName")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("bundleEventName")!, forKey: "bundleEventName")
        }
        if LocalDataController.loadLocalString("startDate")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "startDate")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("startDate")!, forKey: "startDate")
        }
        if LocalDataController.loadLocalString("endDate")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "endDate")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("endDate")!, forKey: "endDate")
        }
        if LocalDataController.loadLocalString("startTime")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "startTime")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("startTime")!, forKey: "startTime")
        }
        if LocalDataController.loadLocalString("endTime")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "endTime")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("endTime")!, forKey: "endTime")
        }
        if LocalDataController.loadLocalString("description")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "description")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("description")!, forKey: "description")
        }
        if LocalDataController.loadLocalInt("minNumberOfGuests")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "minNumberOfGuests")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalInt("minNumberOfGuests")!, forKey: "minNumberOfGuests")
        }
        if LocalDataController.loadLocalInt("maxNumberOfGuests")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "maxNumberOfGuests")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalInt("maxNumberOfGuests")!, forKey: "maxNumberOfGuests")
        }
        if LocalDataController.loadLocalDouble("price")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "price")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalDouble("price")!, forKey: "price")
        }
        if LocalDataController.loadLocalString("paymentDeadline")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "paymentDeadline")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("paymentDeadline")!, forKey: "paymentDeadline")
        }
        if LocalDataController.loadLocalString("rsvpDeadline")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "rsvpDeadline")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("rsvpDeadline")!, forKey: "rsvpDeadline")
        }
        if LocalDataController.loadLocalString("bundleEventPriceStructureType")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "bundleEventPriceStructureType")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("bundleEventPriceStructureType")!, forKey: "bundleEventPriceStructureType")
        }
        if LocalDataController.loadLocalFloat("bundleEventLatitude")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "bundleEventLatitude")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalFloat("bundleEventLatitude")!, forKey: "bundleEventLatitude")
        }
        if LocalDataController.loadLocalFloat("bundleEventLongitude")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "bundleEventLongitude")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalFloat("bundleEventLongitude")!, forKey: "bundleEventLongitude")
        }


        return dataDictionary
    }

    //MARK: PREPARE BUNDLE ADDRESS POST PARAMETERS

    static func prepareBundleAddressPOSTParameters() -> [String:AnyObject]{

        var dataDictionary = [String:AnyObject]()


        if LocalDataController.loadLocalInt("postalAddressID")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "id")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalInt("postalAddressID")!, forKey: "id")
        }

        if LocalDataController.loadLocalString("postalAddressLastName")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "lastName")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressLastName")!, forKey: "lastName")
        }

        if LocalDataController.loadLocalString("postalAddressFirstName")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "firstName")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressFirstName")!, forKey: "firstName")
        }
        if LocalDataController.loadLocalString("postalAddressName")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "name")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressName")!, forKey: "name")
        }
        if LocalDataController.loadLocalString("postalAddressStreetNumber")! == "" {
            dataDictionary.updateValue("Unknown Street Number", forKey: "streetNumber")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressStreetNumber")!, forKey: "streetNumber")
        }
        if LocalDataController.loadLocalString("postalAddressStreet")! == "" {
            dataDictionary.updateValue("Unknown Street", forKey: "street")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressStreet")!, forKey: "street")
        }
        if LocalDataController.loadLocalString("postalAddressUnit")! == "" {
            dataDictionary.updateValue(NSNull(), forKey: "unit")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressUnit")!, forKey: "unit")
        }
        if LocalDataController.loadLocalString("postalAddressCity")! == "" {
            dataDictionary.updateValue("Unknown City", forKey: "city")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressCity")!, forKey: "city")
        }
        if LocalDataController.loadLocalString("postalAddressState")! == "" {
            dataDictionary.updateValue("Unknown State", forKey: "state")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressState")!, forKey: "state")
        }
        if LocalDataController.loadLocalString("postalAddressPostalCode")! == "" {
            dataDictionary.updateValue("Unkown Postal Code", forKey: "postalCode")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressPostalCode")!, forKey: "postalCode")
        }
        if LocalDataController.loadLocalString("postalAddressCountry")! == "" {
            dataDictionary.updateValue("Unkown Country", forKey: "country")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalString("postalAddressCountry")!, forKey: "country")
        }
        if LocalDataController.loadLocalFloat("postalAddressLatitude")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "latitude")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalFloat("postalAddressLatitude")!, forKey: "latitude")
        }
        if LocalDataController.loadLocalFloat("postalAddressLongitude")! == 0 {
            dataDictionary.updateValue(NSNull(), forKey: "longitude")
        } else {
            dataDictionary.updateValue(LocalDataController.loadLocalFloat("postalAddressLongitude")!, forKey: "longitude")
        }

        let bundlePostalAddress : [String:AnyObject] = [
            "id": dataDictionary["id"]!,
            "firstName": dataDictionary["firstName"]!,
            "lastName": dataDictionary["lastName"]!,
            "name": dataDictionary["name"]!,
            "streetNumber": dataDictionary["streetNumber"]!,
            "street": dataDictionary["street"]!,
            "unit": dataDictionary["unit"]!,
            "city": dataDictionary["city"]!,
            "state": dataDictionary["state"]!,
            "postalCode": dataDictionary["postalCode"]!,
            "country": dataDictionary["country"]!,
            "latitude": dataDictionary["latitude"]!,
            "longitude": dataDictionary["longitude"]!]

        return bundlePostalAddress
    }


    //MARK: - PREPARE UPDATED USER PARAMETERS

    static func prepareUserPUTParameters(id: Int?, firstName: String, lastName: String, gender: String?, birthDate: String?, phoneNumber: String?, completion:(success: Bool, user: [String:AnyObject]?, messageTitle: String, message: String)->Void){

        var dataDictionary = [String:AnyObject]()

        if gender != "" {

            dataDictionary.updateValue(gender!, forKey: "gender")

        } else {

            dataDictionary.updateValue(NSNull(), forKey: "gender")
        }

        if birthDate != "" {

            dataDictionary.updateValue(birthDate!, forKey: "birthDate")

        } else {

            dataDictionary.updateValue(NSNull(), forKey: "birthDate")
        }

        if phoneNumber != "" {

            dataDictionary.updateValue(phoneNumber!, forKey: "phoneNumber")

        } else {

            dataDictionary.updateValue(NSNull(), forKey: "phoneNumber")
        }

        if id != nil {

            dataDictionary.updateValue(id!, forKey: "id")

            if firstName != "" {

                dataDictionary.updateValue(firstName, forKey: "firstName")

                if lastName != "" {

                    dataDictionary.updateValue(lastName, forKey: "lastName")

                    if let user : [String:AnyObject] = [
                        "id": dataDictionary["id"] as! Int,
                        "firstName": dataDictionary["firstName"] as! String,
                        "lastName": dataDictionary["lastName"] as! String,
                        "gender": dataDictionary["gender"]!,
                        "birthDate": dataDictionary["birthDate"]!,
                        "phoneNumber": dataDictionary["phoneNumber"]!] {

                        completion(success: true, user: user, messageTitle: "Success!", message: "User information has been updated!")

                    } else {

                        completion(success: false, user: nil, messageTitle: "Error", message: "There seems to be a problem. Please try again.")
                    }


                } else {

                    completion(success: false, user: nil, messageTitle: "Incomplete", message: "A last name is a required field.")
                }

            } else {

                completion(success: false, user: nil, messageTitle: "Incomplete", message: "A first name is a required field.")
            }

        } else {

            completion(success: false, user: nil, messageTitle: "Error", message: "There seems to be a problem. Please try again.")
        }
    }



    //MARK: - PREPARE UPDATED USER COMMERCE METHOD PARAMETERS

    static func prepareUserCommerceMethodPUTParameters(id: Int?, name: String, expirationMonth: String, expirationYear: String, isPaymentDefault: Bool, isCollectionDefault: Bool, completion:(success: Bool, commerceMethod:[String: AnyObject]?, messageTitle: String, message: String)->Void){

        var dataDictionary = [String:AnyObject]()


        if id != nil {

            dataDictionary.updateValue(id!, forKey: "id")

            if name != "" {

                dataDictionary.updateValue(name, forKey: "name")

                if expirationMonth != "" {

                    dataDictionary.updateValue(expirationMonth, forKey: "expirationMonth")

                    if expirationYear != "" {

                        dataDictionary.updateValue(expirationYear, forKey: "expirationYear")

                        if let creditCard : [String:AnyObject] = ["id": dataDictionary["id"] as! Int,
                                                                  "name": dataDictionary["name"] as! String,
                                                                  "expirationMonth": dataDictionary["expirationMonth"] as! String,
                                                                  "expirationYear": dataDictionary["expirationYear"] as! String,
                                                                  "isPaymentDefault": isPaymentDefault,
                                                                  "isCollectionDefault": isCollectionDefault ]{

                            completion(success: true, commerceMethod: creditCard, messageTitle: "Success!", message: "Your credit card has been updated!")

                        } else {

                            completion(success: false, commerceMethod: nil, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
                        }

                    } else {

                        completion(success: false, commerceMethod: nil, messageTitle: "Oops!", message: "The credit card is required to have an expiration year.")
                    }

                } else {
                    completion(success: false, commerceMethod: nil, messageTitle: "Oops!", message: "The credit card is required to have an expiration month.")
                }
            } else {
                completion(success: false, commerceMethod: nil, messageTitle: "Oops!", message: "The credit card is required to have a card holder name.")
            }
        } else {
            completion(success: false, commerceMethod: nil, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
        }

    }




    //MARK: - PREPARE USER COMMERCE METHOD POST PARAMETERS

    static func prepareUserCommerceMethodPOSTParameters(name: String, number: String, cvc: String, expirationMonth: String, expirationYear: String, currency: String, type: String, ipAddress: String, country: String, isDebit: Bool, completion:(success: Bool, commerceMethod: [String:AnyObject]?, messageTitle: String, message: String)->Void){

        var dataDictionary : [String:AnyObject] = [:]

        if name != ""{
            dataDictionary.updateValue(name, forKey: "name")

            if number != ""{
                dataDictionary.updateValue(number, forKey: "number")

                if cvc != ""{
                    dataDictionary.updateValue(cvc, forKey: "cvc")

                    if expirationMonth != ""{
                        dataDictionary.updateValue(expirationMonth, forKey: "expirationMonth")

                        if expirationYear != ""{
                            dataDictionary.updateValue(expirationYear, forKey: "expirationYear")

                            if currency != ""{
                                dataDictionary.updateValue(currency, forKey: "currency")

                                if type != ""{
                                    dataDictionary.updateValue(type, forKey: "type")
                                } else {
                                    dataDictionary.updateValue(NSNull(), forKey: "type")
                                }
                                if ipAddress != ""{
                                    dataDictionary.updateValue(ipAddress, forKey: "ipAddress")
                                } else {
                                    dataDictionary.updateValue(NSNull(), forKey: "ipAddress")
                                }
                                if country != ""{
                                    dataDictionary.updateValue(country, forKey: "country")
                                } else {
                                    dataDictionary.updateValue(NSNull(), forKey: "country")
                                }

                                if let commerceMethod : [String:AnyObject] = [
                                    "name": dataDictionary["name"]!,
                                    "number": dataDictionary["number"]!,
                                    "cvc": dataDictionary["cvc"]!,
                                    "expirationMonth": dataDictionary["expirationMonth"]!,
                                    "expirationYear": dataDictionary["expirationYear"]!,
                                    "currency": dataDictionary["currency"]!,
                                    "type": dataDictionary["type"]!,
                                    "ipAddress": dataDictionary["ipAddress"]!,
                                    "country": dataDictionary["country"]!,
                                    "isDebit": isDebit
                                    ]{

                                    completion(success: true, commerceMethod: commerceMethod, messageTitle: "Success!", message: "Credit card successfully created!")
                                    print(commerceMethod)
                                } else {

                                    completion(success: false, commerceMethod: nil, messageTitle: "Error", message: "An unknown error occured. Please try again")
                                }

                            } else {
                                completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The currency type is required!")
                            }
                        } else {
                            completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The expiration year is required!")
                        }
                    } else {
                        completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The expiration month is required!")
                    }
                } else {
                    completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The card CVC is required!")
                }
            } else {
                completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The card number is required!")
            }
        } else {
            completion(success: false, commerceMethod: nil, messageTitle: "Incomplete", message: "The cardholder name is required!")
        }

    }

    //MARK: PREPARE BANK ACCOUNT POST PARAMETERS

    static func prepareBankAccountPOSTParameters(accountHolderName: String, currency: String, country: String, accountNumber: String, routingNumber: String, ipAddress: String?, type: String, completion:(success: Bool, bankAccountParameters: [String:AnyObject]?, messageTitle: String, message: String)->Void){

        var dataDictionary = [String:AnyObject]()

        if accountHolderName != ""{

            dataDictionary.updateValue(accountHolderName, forKey: "accountHolderName")

            if currency != ""{

                dataDictionary.updateValue(currency, forKey: "currency")

                if country != "" {

                    dataDictionary.updateValue(country, forKey: "country")

                    if accountNumber != "" {

                        dataDictionary.updateValue(accountNumber, forKey: "accountNumber")

                        if routingNumber != "" {

                            dataDictionary.updateValue(routingNumber, forKey: "routingNumber")

                            if type != "" {

                                dataDictionary.updateValue(type, forKey: "type")

                                if ipAddress != nil {

                                    dataDictionary.updateValue(ipAddress!, forKey: "ipAddress")

                                } else {

                                    dataDictionary.updateValue(NSNull(), forKey: "ipAddress")

                                }

                                if let bankAccountParameters : [String:AnyObject] = [
                                    "accountHolderName": dataDictionary["accountHolderName"]!,
                                    "currency": dataDictionary["currency"]!,
                                    "country": dataDictionary["country"]!,
                                    "accountNumber": dataDictionary["accountNumber"]!,
                                    "routingNumber": dataDictionary["routingNumber"]!,
                                    "ipAddress": dataDictionary["ipAddress"]!,
                                    "type": dataDictionary["type"]!
                                    ] {
                                    completion(success: true, bankAccountParameters: bankAccountParameters, messageTitle: "Success!", message: "Bank account has been successfully added.")

                                } else {

                                    completion(success: false, bankAccountParameters: nil, messageTitle: "Error", message: "There seems to be a problem. Please check your network settings or try again.")
                                }


                            } else {

                                completion(success: false, bankAccountParameters: nil, messageTitle: "Account Type", message: "An account type is required to create a bank account.")
                            }

                        } else {

                            completion(success: false, bankAccountParameters: nil, messageTitle: "Routing Number", message: "A routing number is required to create a bank account.")
                        }


                    } else {

                        completion(success: false, bankAccountParameters: nil, messageTitle: "Account Number", message: "An account number is required to create a bank account.")
                    }

                } else {

                    completion(success: false, bankAccountParameters: nil, messageTitle: "Country", message: "A country is required to create a bank account.")
                }
                
            } else {
                
                completion(success: false, bankAccountParameters: nil, messageTitle: "Currency", message: "A currency type is required to create a bank account.")
            }
            
        } else {
            
            completion(success: false, bankAccountParameters: nil, messageTitle: "Account Name", message: "The account holder name is required to create a bank account.")
        }

    }

    //MARK: - PREPARE USER PASSWORD UPDATE PARAMETERS

    static func prepareUserPasswordPUTParameters(currentPassword: String, newPassword: String, confirmPassword: String, completion:(success: Bool, passwordParameters: [String:String]?, messageTitle: String, message: String)-> Void){

        var dataDictionary = [String:String]()

        if currentPassword != "" {

            dataDictionary.updateValue(currentPassword, forKey: "currentPassword")

            if newPassword != "" {

                if currentPassword != newPassword {

                    dataDictionary.updateValue(newPassword, forKey: "newPassword")

                    if confirmPassword == newPassword {

                        if let passwordParameters : [String:String] = [
                            "currentPassword": dataDictionary["currentPassword"]!,
                            "newPassword": dataDictionary["newPassword"]!]{

                            completion(success: true, passwordParameters: passwordParameters, messageTitle: "Success!", message: "Password has been succesfully updated!")

                        } else {

                            completion(success: false, passwordParameters: nil, messageTitle: "Error", message: "There seems to be a problem. Please try again.")
                        }

                    } else {

                        completion(success: false, passwordParameters: nil, messageTitle: "Incomplete!", message: "The new password and the confirmed password don't match!")
                    }

                } else {

                    completion(success: false, passwordParameters: nil, messageTitle: "Oops!", message: "The current password and the new password are the same!")
                }

            } else {

                completion(success: false, passwordParameters: nil, messageTitle: "Incomplete!", message: "A new password is required to update!")
            }

        } else {

            completion(success: false, passwordParameters: nil, messageTitle: "Incomplete!", message: "Your current password is required to  update to a new password!")
        }

    }

    //MARK: - PREPARE REGISTER USER POST PARAMETERS

    static func prepareRegisterUserPOSTParameters(email: String, password: String, confirmPassword: String, termsAndConditions: Bool, completion:(success: Bool, registrationParameters: [String:AnyObject]?, messageTitle: String, message: String)->Void){

        if email != "" {

            if password != "" {

                if confirmPassword != "" {

                    if password == confirmPassword {

                        if termsAndConditions == true {


                            if let registrationParameters : [String:AnyObject] = [
                                "email": email,
                                "password": password,
                                "acceptedTermsAndConditions": termsAndConditions
                                ] {

                                completion(success: true, registrationParameters: registrationParameters, messageTitle: "", message: "")
                            } else {

                                completion(success: false, registrationParameters: nil, messageTitle: "Error", message: "There seems to be a problem. Please try again.")
                            }


                        } else {

                            // terms of service is false

                            completion(success: false, registrationParameters: nil, messageTitle: "Terms of Service", message: "In order to continue, you must agree to the Terms of Service")

                        }

                    } else {

                        // passwords dont match
                        completion(success: false, registrationParameters: nil, messageTitle: "Passwords", message: "The chosen password and the confirmation password don't match. Please try again.")

                    }

                } else {

                    //confirm password is nil
                    completion(success: false, registrationParameters: nil, messageTitle: "Confirmation Password", message: "The confirmation password is required to continue. Please try again.")

                }

            } else {

                // password is nil
                completion(success: false, registrationParameters: nil, messageTitle: "Password", message: "A password is required to continue. Please try again.")

            }

        } else {

            // email is nil
            completion(success: false, registrationParameters: nil, messageTitle: "Email Address", message: "An email address is required to continue. Please try again.")

        }

    }
}

//    //MARK: - PREPARE UPDATED USER DEBIT CARD//
//    static func prepareDebitCardPUTParameters(id: Int?, name: String, expirationMonth: String, expirationYear: String, isPaymentDefault: Bool, isCollectionDefault: Bool, completion:(success: Bool, debitCard:[String: AnyObject]?, messageTitle: String, message: String)->Void){
//
//        var dataDictionary = [String:AnyObject]()
//
//
//        if id != nil {
//
//            dataDictionary.updateValue(id!, forKey: "id")
//
//            if name != "" {
//
//                dataDictionary.updateValue(name, forKey: "name")
//
//                if expirationMonth != "" {
//
//                    dataDictionary.updateValue(expirationMonth, forKey: "expirationMonth")
//
//                    if expirationYear != "" {
//
//                        dataDictionary.updateValue(expirationYear, forKey: "expirationYear")
//
//                        if let debitCard : [String:AnyObject] = [
//                        "id": dataDictionary["id"] as! Int,
//                        "name": dataDictionary["name"] as! String,
//                        "expirationMonth": dataDictionary["expirationMonth"] as! String,
//                        "expirationYear": dataDictionary["expirationYear"] as! String,
//                        "isPaymentDefault": isPaymentDefault,
//                        "isCollectionDefault": isCollectionDefault
//                            ] {
//
//                            completion(success: true, debitCard: debitCard, messageTitle: "Success!", message: "Your debit card has been updated!")
//
//                        } else {
//
//                            completion(success: false, debitCard: nil, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
//                        }
//
//                    } else {
//
//                        completion(success: false, debitCard: nil, messageTitle: "Oops!", message: "The debit card is required to have an expiration year.")
//                    }
//
//                } else {
//                    completion(success: false, debitCard: nil, messageTitle: "Oops!", message: "The debit card is required to have an expiration month.")
//                }
//            } else {
//                completion(success: false, debitCard: nil, messageTitle: "Oops!", message: "The debit card is required to have a card holder name.")
//            }
//        } else {
//            completion(success: false, debitCard: nil, messageTitle: "Oops!", message: "There seems to be a problem. Please try again.")
//        }
//
//    }



//    //PREPARE USER DEBIT CARD POST PARAMETERS
//
//    static func prepareUserDebitCardPOSTParameters(name: String, number: String, cvc: String, expirationMonth: String, expirationYear: String, currency: String, type: String, ipAddress: String, country: String, isDebit: Bool, completion:(success: Bool, debitCard: [String:AnyObject]?, messageTitle: String, message: String)->Void){
//
//        var dataDictionary : [String:AnyObject] = [:]
//
//        if name != ""{
//            dataDictionary.updateValue(name, forKey: "name")
//
//            if number != ""{
//                dataDictionary.updateValue(number, forKey: "number")
//
//                if cvc != ""{
//                    dataDictionary.updateValue(cvc, forKey: "cvc")
//
//                    if expirationMonth != ""{
//                        dataDictionary.updateValue(expirationMonth, forKey: "expirationMonth")
//
//                        if expirationYear != ""{
//                            dataDictionary.updateValue(expirationYear, forKey: "expirationYear")
//
//                            if currency != ""{
//                                dataDictionary.updateValue(currency, forKey: "currency")
//
//                                if type != ""{
//                                    dataDictionary.updateValue(type, forKey: "type")
//                                } else {
//                                    dataDictionary.updateValue(NSNull(), forKey: "type")
//                                }
//                                if ipAddress != ""{
//                                    dataDictionary.updateValue(ipAddress, forKey: "ipAddress")
//                                } else {
//                                    dataDictionary.updateValue(NSNull(), forKey: "ipAddress")
//                                }
//                                if country != ""{
//                                    dataDictionary.updateValue(country, forKey: "country")
//                                } else {
//                                    dataDictionary.updateValue(NSNull(), forKey: "country")
//                                }
//
//                                if let debitCard : [String:AnyObject] = [
//                                    "name": dataDictionary["name"]!,
//                                    "number": dataDictionary["number"]!,
//                                    "cvc": dataDictionary["cvc"]!,
//                                    "expirationMonth": dataDictionary["expirationMonth"]!,
//                                    "expirationYear": dataDictionary["expirationYear"]!,
//                                    "currency": dataDictionary["currency"]!,
//                                    "type": dataDictionary["type"]!,
//                                    "ipAddress": dataDictionary["ipAddress"]!,
//                                    "country": dataDictionary["country"]!,
//                                    "country": isDebit
//
//                                    ]{
//
//                                    completion(success: true, debitCard: debitCard, messageTitle: "Success!", message: "Debit card successfully created!")
//                                } else {
//
//                                    completion(success: false, debitCard: nil, messageTitle: "Error", message: "An unknown error occured. Please try again")
//                                }
//
//                            } else {
//                                completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The currency type is required!")
//                            }
//                        } else {
//                            completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The expiration year is required!")
//                        }
//                    } else {
//                        completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The expiration month is required!")
//                    }
//                } else {
//                    completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The card CVC is required!")
//                }
//            } else {
//                completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The card number is required!")
//            }
//        } else {
//            completion(success: false, debitCard: nil, messageTitle: "Incomplete", message: "The cardholder name is required!")
//        }
//        
//    }
//
//}











