//
//  UITextFieldExtension.swift
//  Bundle
//
//  Created by Sean Murphy on 8/24/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit


extension UITextField{
	dynamic var defaultFont: UIFont? {
		get { return self.font }
		set { self.font = newValue }
	}
}

