//
//  BankAccount.swift
//  Bundle
//
//  Created by Sean Murphy on 5/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import ObjectMapper


class BankAccount: Mappable{

	var id : Int?
	var name : String?
	var maskedNumber : String?
	var cardType : String?
	var expirationMonth : String?
	var expirationYear : String?
	var createdAt : String?
	var updatedAt : String?
	var service : String?
	var financialType : Int?
	var isPaymentDefault : Bool?
	var isCollectionDefault : Bool?
	var accountHolderName : String?
	var currency : String?
	var country : String?
	var accountNumber : String?
	var routingNumber : String?
	var ipAddress : String?
	var type : String?
	var icon : UIImage {

		return iconForService(service)
	}
	var image: UIImage?{

		return imageForService(service)
	}


	required init?(_ map: Map) {

	}

	init(accountHolderName: String?, currency: String?, country: String?, accountNumber: String?, routingNumber: String?, ipAddress: String?, type: String?){

		self.accountHolderName = accountHolderName
		self.currency = currency
		self.country = country
		self.accountNumber = accountNumber
		self.routingNumber = routingNumber
		self.ipAddress = ipAddress
		self.type = type

	}

	func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		maskedNumber <- map["maskedNumber"]
		cardType <- map["cardType"]
		expirationMonth <- map["expirationMonth"]
		expirationYear <- map["expirationYear"]
		createdAt <- map["createdAt"]
		updatedAt <- map["updatedAt"]
		service <- map["service"]
		financialType <- map["financialType"]
		isPaymentDefault <- map["isPaymentDefault"]
		isCollectionDefault <- map["isCollectionDefault"]
	}

	func iconForService(service: String?) -> UIImage{

		if service == "Stripe"{
			return Icons.Stripe.icon
		} else if service == "Wells Fargo"{
			return Icons.WellsFargoBank.icon
		} else if service == "Chase"{
			return Icons.ChaseBank.icon
		}else if service == "ApplePay"{
			return Icons.ApplePay.icon
		}else if service == "Citibank"{
			return Icons.CitibankBank.icon
		} else {
			return Icons.ApplePay.icon
		}
	}

	func imageForService(service: String?) -> UIImage{

		if service == "Stripe"{
			return Icons.StripeBankLarge.icon
		} else if service == "Wells Fargo"{
			return Icons.WellsFargoBank.icon
		} else if service == "Chase"{
			return Icons.ChaseBankLarge.icon
		}else if service == "ApplePay"{
			return Icons.ApplePay.icon
		}else if service == "Citibank"{
			return Icons.CitibankBank.icon
		} else {
			return Icons.ApplePay.icon
		}
	}

}





