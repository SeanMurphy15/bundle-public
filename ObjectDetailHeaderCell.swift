//
//  DetailHeaderCell.swift
//  Bundle
//
//  Created by Sean Murphy on 9/2/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit


class ObjectDetailHeaderCell: UITableViewCell{

	@IBOutlet weak var tag4Label: UILabel!
	@IBOutlet weak var tag4TitleLabel: UILabel!
	@IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var subTitleLabel: UILabel!
	@IBOutlet weak var tagTitleLabel: UILabel!

	@IBOutlet weak var tag3Label: UILabel!
	@IBOutlet weak var tag2Label: UILabel!
	@IBOutlet weak var tag3TitleLabel: UILabel!
	@IBOutlet weak var tag2TitleLabel: UILabel!
	@IBOutlet weak var tagLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var backgroundImageOverlay: UIImageView!

	func isBankHeader(){

		titleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.Bank, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))

	}

	func isCardHeader(){

		titleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.CreditCard, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))
	}

	func isSettingsHeader(){

		titleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.Gear, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))
	}


	func isProfileHeader(){

		iconImageView.createCircularImageWithWhiteBorder()


	}

	func isBankAccountTypeHeader(bankAccount: BankAccount){

		iconImageView.layer.addShadow()
		iconImageView.image = bankAccount.image
		iconImageView.roundedCorners(5)
		titleLabel.text = bankAccount.service ?? "Unknown"
		subTitleLabel.text = "Bank Account"

		if let number = bankAccount.maskedNumber{
			subTitleLabel.text = "**** **** ****\(number)"
		} else {
			subTitleLabel.text = "**** **** **** ****"
		}

		if bankAccount.isPaymentDefault == true {
			tag2Label.text = "Default"
			tag2Label.textColor = UIColor.bundleGreenColor()
		}else{
			tag2Label.text = "No"
			tag2Label.textColor = UIColor.bundleDarkGrayColor()
		}
		if bankAccount.isCollectionDefault == true {
			tag3Label.text = "Default"
			tag3Label.textColor = UIColor.bundleGreenColor()
		}else{
			tag3Label.text = "No"
			tag3Label.textColor = UIColor.bundleDarkGrayColor()
		}

		tagLabel.text = bankAccount.updatedAt

	}

	func isCardTypeHeader(card: Card){

		iconImageView.layer.addShadow()
		iconImageView.image = card.image
		titleLabel.text = card.name ?? "Unknown"

		if let number = card.maskedNumber{
			subTitleLabel.text = "**** **** ****\(number)"
		} else {
			subTitleLabel.text = "**** **** **** ****"
		}

		if card.isPaymentDefault == true {
			tag2Label.text = "Default"
			tag2Label.textColor = UIColor.bundleGreenColor()
		}else{
			tag2Label.text = "No"
			tag2Label.textColor = UIColor.bundleDarkGrayColor()
		}
		if card.isCollectionDefault == true {
			tag3Label.text = "Default"
			tag3Label.textColor = UIColor.bundleGreenColor()
		}else{
			tag3Label.text = "No"
			tag3Label.textColor = UIColor.bundleDarkGrayColor()
		}

		tagLabel.text = card.updatedAt
	}

}
