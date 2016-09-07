//
//  CALayerExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 7/28/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

extension CALayer {

	func addBorderOnEdge(edge: UIRectEdge, color: UIColor, thickness: CGFloat, alpha: CGFloat) {

		let border = CALayer()

		switch edge {
		case UIRectEdge.Top:
			border.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), thickness)
			break
		case UIRectEdge.Bottom:
			border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, CGRectGetWidth(self.frame), thickness)
			break
		case UIRectEdge.Left:
			border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame))
			break
		case UIRectEdge.Right:
			border.frame = CGRectMake(CGRectGetWidth(self.frame) - thickness, 0, thickness, CGRectGetHeight(self.frame))
			break
		default:
			break
		}

		border.backgroundColor = color.colorWithAlphaComponent(alpha).CGColor

		self.addSublayer(border)
	}

}

extension CALayer {

	func bundleTextFieldLayerAttributes(){

		self.borderColor = UIColor.bundleLightBlueColor().CGColor
		self.borderWidth = 2
		self.cornerRadius = 5
		self.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
	}
}

extension CALayer {

	func bundleButtonLayerFillAttributes(){
		self.cornerRadius = 5
	}

	func bundleButtonLayerOutlineAttributes(outlineColor: UIColor){
		self.cornerRadius = 5
		self.backgroundColor = UIColor.clearColor().CGColor
		self.borderWidth = 2
		self.borderColor = outlineColor.CGColor
	}

}

extension CALayer {

	func addShadow(){
		self.shadowColor = UIColor.blackColor().CGColor
		self.shadowOpacity = 0.5
		self.shadowOffset = CGSizeMake(-3, -3)
		self.shadowPath = UIBezierPath(rect: self.bounds).CGPath
	}
}





















