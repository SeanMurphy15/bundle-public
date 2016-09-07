//
//  BundleController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/23/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class BundleController{

    static var sharedInstance = UserController()
    static var authToken = "Bearer \(UserController.sharedInstance.fetchCurrentUserAuthToken()!)"
    static var baseURL = "http://api-bundle-dev.azurewebsites.net"
    static let headers = ["Authorization": authToken,"Content-Type": "application/json"]

    // MARK: - FETCH BUNDLES

	static func fetchUserBundles(completion:(success: Bool, bundles : [Bundle]?)->Void){

		Alamofire.request(.GET, "\(baseURL)/bundle", encoding: .JSON, headers: headers).responseArray(keyPath: "items") { (response: Response<[Bundle], NSError>) in

			if response.result.isFailure {

				completion(success: false, bundles: nil)

			} else {

				if let bundles = response.result.value{

					completion(success: true, bundles: bundles)
				}
			}
		}
	}

    // MARK: - POST BUNDLE

    
    
    
    //MARK: - INVITE USER TO BUNDLE
    
    static func inviteUserToBundle(bundleID: Int, inviteeUserAccountId: Int, completion:(success:Bool, message: String)->Void){
        
        let parameters: [String: AnyObject] = ["inviteeUserAccountId": inviteeUserAccountId]
        
        Alamofire.request(.POST, "\(baseURL)/bundle/\(bundleID)/invite", parameters: parameters, encoding: .JSON, headers: headers).validate().responseJSON { (response) in
            
            if response.result.isFailure{
                
                debugPrint(response)
                
                let json = JSON(response.result.value!)
                
                if let message = json["message"].string{
                    
                    completion(success: false, message: message)
                }
                
            } else {
                
                print(response)
                
                let json = JSON(response.result.value!)
                
                if let message = json["message"].string{
                    
                    completion(success: true, message: message)
                }
            }
        }
        
    }
    
    //MARK: - ADD USER TO BUNDLE 
    //Add guest to bundle event. (EX. As a user I want to add myself to a bundle event)
    
    static func addUserToBundle(bundleID: Int, userAccountId: Int, rsvpStatus: String, bundleEventRole: String, completion:(success:Bool, message: String?)->Void){
        
        let parameters: [String: AnyObject] = [
            "userAccountId": userAccountId,
            "rsvpStatus": rsvpStatus,
            "bundleEventRole": bundleEventRole
        ]
        
        Alamofire.request(.POST, "\(baseURL)/bundle/\(bundleID)/users", parameters: parameters, encoding: .JSON, headers: headers).responseJSON { (response) in
            
            if response.result.isFailure{
                
                debugPrint(response)
                
                let json = JSON(response.result.error!)
                
                if let message = json["message"].string{
                    
                    completion(success: false, message: message)
                }
                
            } else {
                
                
                let json = JSON(response.result.value!)
                
                if let message = json["message"].string{
                    
                    completion(success: true, message: message)
                }
                
                
            }
        }
        
    }

    //MARK: - DELETE BUNDLE

    static func deleteBundle(bundleID: Int, completion:(success: Bool, message: String)->Void){


        Alamofire.request(.POST, "\(baseURL)/bundle/\(bundleID)", encoding: .JSON, headers: headers).validate().responseJSON { (response) in

            if response.result.isFailure{

                print("Unable to delete Bundle")
                completion(success: false, message: "Oops! Unable to delete bundle. Check the network connection and try again!")

            } else {
                
                let json = JSON(response.result.value!)

                if let result = json["success"].bool{

                    if result == true {

                        completion(success: true, message: "Bundle successfully deleted!")
                    }
                }

            }
        }
    }
    
}


