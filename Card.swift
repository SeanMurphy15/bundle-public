//
//  CreditCard.swift
//  Bundle
//
//  Created by Sean Murphy on 4/26/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import ObjectMapper


class Card: Mappable{

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
	var number : String?
	var cvc : String?
	var currency : String?
	var type : String?
	var ipAddress : String?
	var country : String?
	var isDebit : Bool?
	var icon : UIImage?{

		return iconForCardType(cardType)
	}
	var image : UIImage?{

		return imageForCardType(cardType)
	}


	required init?(_ map: Map) {

	}

	init(name: String?, number: String?, cvc: String?, expirationMonth: String?, expirationYear: String?, currency: String?, type: String?, ipAddress: String?, country: String?, isDebit: Bool?, isCollectionDefault: Bool?){

		self.name = name
		self.number = number
		self.cvc = cvc
		self.expirationMonth = expirationMonth
		self.expirationYear = expirationYear
		self.currency = currency
		self.type = type
		self.ipAddress = ipAddress
		self.country = country
		self.isDebit = isDebit

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


	func iconForCardType(cardType: String?) -> UIImage{

		if cardType == "Stripe"{
			return Icons.Stripe.icon
		} else if cardType == "Visa"{
			return Icons.VisaCard.icon
		} else if cardType == "Mastercard"{
			return Icons.MasterCard.icon
		}else if cardType == "ApplePay"{
			return Icons.ApplePay.icon
		}else if cardType == "AmericanExpress"{
			return Icons.AmexCard.icon
		} else if cardType == "Discover"{
			return Icons.DiscoverCard.icon
		} else {
			return Icons.DefaultCard.icon
		}
	}

	//TODO: add more large images

	func imageForCardType(cardType: String?) -> UIImage{

		if cardType == "Visa"{
			return Icons.VisaCardLargeDark.icon
		} else if cardType == "Mastercard"{
			return Icons.MasterCardLargeDark.icon
		}else if cardType == "AmericanExpress"{
			return Icons.AmexCardLargeDark.icon
		} else if cardType == "Discover"{
			return Icons.DiscoverCardLargeDark.icon
		} else {
			return Icons.DefaultCardLarge.icon
		}
	}
	
}

