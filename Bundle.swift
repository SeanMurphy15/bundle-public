//
//  Bundle.swift
//  Bundle
//
//  Created by Sean Murphy on 4/22/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import ObjectMapper


class Bundle: Mappable{

	var id : Int?
	var bundleEventName : String?
	var description : String?
	var imageUrl : String?
	var minNumberOfGuests : Int?
	var maxNumberOfGuests : Int?
	var price : Int?
	var rsvpDeadline : String?
	var startDate : String?
	var endDate : String?
	var bundleEventPriceStructureType : String?
	var totalGuests : Int?
	var confirmedGuests : Int?
	var awaitingGuests : Int?
	var postalAddress : PostalAddress?


	required init?(_ map: Map){

	}

	func mapping(map: Map) {


		id <- map["id"]
		bundleEventName <- map["bundleEventName"]
		description <- map["description"]
		imageUrl <- map["imageUrl"]
		minNumberOfGuests <- map["minNumberOfGuests"]
		maxNumberOfGuests <- map["maxNumberOfGuests"]
		price <- map["price"]
		rsvpDeadline <- map["rsvpDeadline"]
		startDate <- map["startDate"]
		endDate <- map["endDate"]
		bundleEventPriceStructureType <- (map["bundleEventPriceStructureType"], priceTypeTransform())
		totalGuests <- map["totalGuests"]
		confirmedGuests <- map["confirmedGuests"]
		awaitingGuests <- map["awaitingGuests"]
	}



}