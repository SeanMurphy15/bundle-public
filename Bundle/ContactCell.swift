//
//  ContactCell.swift
//  Bundle
//
//  Created by Sean Murphy on 4/18/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

	@IBOutlet weak var contactNameLabel: UILabel!

	@IBOutlet weak var selectionIconImageView: UIImageView!
	@IBOutlet weak var backgroundCardView: UIView!

	@IBOutlet weak var contactEmailLabel: UILabel!
	
	@IBOutlet weak var contactProfileImageView: UIImageView!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func updateUI(){
		selectionIconImageView.image = UIImage.fontAwesomeIconWithName(.Check, textColor: UIColor.bundleGreenColor(), size: CGSizeMake(50,50))
		backgroundCardView.layer.cornerRadius = 10.0
		backgroundCardView.layer.masksToBounds = false
		backgroundCardView.layer.borderWidth = 10.0
		backgroundCardView.layer.borderColor = UIColor.clearColor().CGColor
		backgroundCardView.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
		backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
		backgroundCardView.layer.shadowOpacity = 1.5
		contactProfileImageView.createCircularImageWithWhiteBorder()

	}

}
