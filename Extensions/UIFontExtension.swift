//
//  StringExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 8/24/16.
////  Copyright © 2016 Bundle. All rights reserved.
////
//
import Foundation

extension UIFont{

	static func bundleFontRegular(size: CGFloat) -> UIFont?{

		let font = UIFont(name: "Raleway-Regular", size: size)
		return font

	}
	static func bundleFontLight(size: CGFloat) -> UIFont?{

		let font = UIFont(name: "Raleway-Light", size: size)
		return font

	}
	static func bundleFontBold(size: CGFloat) -> UIFont?{

		let font = UIFont(name: "Raleway-Bold", size: size)
		return font

	}
}