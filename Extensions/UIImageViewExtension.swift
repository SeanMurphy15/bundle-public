//
//  UIKit.swift
//  Bundle
//
//  Created by Sean Murphy on 7/28/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

	func createCircularImageWithWhiteBorder(){
		layer.cornerRadius = self.bounds.size.width / 2
		layer.masksToBounds = true
		let borderWidth : CGFloat = 2
		self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth)
		layer.borderColor = UIColor.whiteColor().CGColor
		self.clipsToBounds = true
		self.layer.borderWidth = borderWidth
	}

	func createCircularImageWithDarkBlueBorder(){
		layer.cornerRadius = self.bounds.size.width / 2
		layer.masksToBounds = true
		let borderWidth : CGFloat = 2
		self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth)
		layer.borderColor = UIColor.bundleDarkBlueColor().CGColor
		self.clipsToBounds = true
		self.layer.borderWidth = borderWidth

	}

	func roundedCorners(radius: CGFloat){

		self.layer.cornerRadius = radius
	}

}