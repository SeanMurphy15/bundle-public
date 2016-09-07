//
//  Transform.swift
//  Bundle
//
//  Created by Sean Murphy on 8/27/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import ObjectMapper


public class priceTypeTransform: TransformType {
	public typealias Object = String
	public typealias JSON = String

	public init() {}

	public func transformFromJSON(value: AnyObject?) -> String? {
		if let priceType = value as? String{
			if priceType == "EqualSplit"{
				return "Per Person"
			} else {
				return "Total"
			}
		}
		return nil
	}

	public func transformToJSON(value: String?) -> String? {
		if let priceType = value {
			if priceType == "Total"{
				return "Fixed"
			} else {
				return "EqualSplit"
			}
		}
		return nil
	}
}

//public class dateTransform: TransformType {
//	public typealias Object = String
//	public typealias JSON = String
//
//	public init() {}
//
//	public func transformFromJSON(value: AnyObject?) -> String? {
//		if let date = value as? String{
//		let newDate = ConversionController.convertStringToNSDate(date)
//			print(newDate)
//		}
//		return nil
//	}
//
//	public func transformToJSON(value: String?) -> String? {
//		if let date = value {
//			return date
//		}
//		return nil
//	}
//}
