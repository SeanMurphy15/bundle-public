//
//  UILabelExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 7/28/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

	func addSquareBoarder(borderWidth: CGFloat, color: UIColor, alpha: CGFloat){
		layer.masksToBounds = true
		layer.borderWidth = borderWidth
		layer.borderColor = color.CGColor
		self.alpha = alpha
		self.clipsToBounds = true
	}

	}

extension UILabel{
	dynamic var defaultFont: UIFont? {
		get { return self.font }
		set { self.font = newValue }
	}
}
