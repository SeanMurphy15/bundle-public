//
//  Transaction.swift
//  Bundle
//
//  Created by Sean Murphy on 8/4/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class Transaction: Mappable{

	var id : Int?
	var amount : Int?
	var currency : String?
	var transactionDescription : String?
	var providerTransactionId : String?
	var authorizationCode : String?
	var success : Bool?
	var rejectionReason : String?
	var status : String?
	var isPrivate : Bool?
	var createdAt : String?
	var updatedAt : String?
	var receiverImageUrl : String?
	var receiverLastName : String?
	var receiverFirstName : String?
	var receiverEmail : String?
	var senderImageUrl : String?
	var senderLastName : String?
	var senderFirstName : String?
	var senderEmail : String?
	var remainingAuthorizedAmount : Int?
	var collectionMethodId : Int?
	var paymentMethodId : Int?
	var bundleEventName : String?
	var bundleEventId : Int?


	required init?(_ map: Map){

	}

	func mapping(map: Map) {
		id <- map["id"]
		amount <- map["amount"]
		currency <- map["currency"]
		transactionDescription <- map["transactionDescription"]
		providerTransactionId <- map["providerTransactionId"]
		authorizationCode <- map["authorizationCode"]
		success <- map["success"]
		rejectionReason <- map["rejectionReason"]
		status <- map["status"]
		isPrivate <- map["isPrivate"]
		createdAt <- map["createdAt"]
		updatedAt <- map["updatedAt"]
		receiverImageUrl <- map["to.imageUrl"]
		receiverLastName <- map["to.firstName"]
		receiverFirstName <- map["to.lastName"]
		receiverEmail <- map["to.email"]
		senderImageUrl <- map["from.imageUrl"]
		senderLastName <- map["from.lastName"]
		senderFirstName <- map["from.firstName"]
		senderEmail <- map["from.email"]
		remainingAuthorizedAmount <- map["remainingAuthorizedAmount"]
		collectionMethodId <- map["collectionMethodId"]
		paymentMethodId <- map["paymentMethodId"]
		bundleEventName <- map["bundleEventName"]
		bundleEventId <- map["bundleEventId"]
		
	}

}

