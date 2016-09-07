//
//  CustomCell.swift
//  Bundle
//
//  Created by Sean Murphy on 8/29/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit

class BundleCell: UITableViewCell{

	@IBOutlet weak var bundleHostNameLabel: UILabel!
	@IBOutlet weak var bundleCellHeaderView: UIView!
	@IBOutlet weak var bundleLocationLabel: UILabel!
	@IBOutlet weak var daysToJoinLabel: UILabel!
	@IBOutlet weak var bundleGuestsLabel: UILabel!
	@IBOutlet weak var bundleDescriptionTextView: UITextView!
	@IBOutlet weak var bundleHostProfileImageView: UIImageView!
	@IBOutlet weak var bundleEventNameLabel: UILabel!
	@IBOutlet weak var bundlePrice: UILabel!
	@IBOutlet weak var backgroundCardView: UIView!

	@IBOutlet weak var bundleDataView: UIView!
	func updateUI(){
		let thickness : CGFloat = 2

		backgroundCardView.backgroundColor = UIColor.whiteColor()
		backgroundCardView.layer.cornerRadius = 5.0
		backgroundCardView.layer.masksToBounds = false
		backgroundCardView.layer.borderWidth = 5.0
		backgroundCardView.layer.borderColor = UIColor.clearColor().CGColor
		backgroundCardView.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
		backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
		backgroundCardView.layer.shadowOpacity = 1.5
		bundleCellHeaderView.layer.cornerRadius = 5.0
		bundleCellHeaderView.layer.borderColor = UIColor.whiteColor().CGColor
		bundleCellHeaderView.layer.borderWidth = thickness
		bundleHostProfileImageView.createCircularImageWithWhiteBorder()
	}


}