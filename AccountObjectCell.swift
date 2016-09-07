//
//  AccountObjectCell.swift
//  Bundle
//
//  Created by Sean Murphy on 8/29/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit

class AccountObjectCell: UITableViewCell{

	@IBOutlet weak var editButton: UIButton!

	@IBOutlet weak var objectIconImageView: UIImageView!
	@IBOutlet weak var objectTitleLabel: UILabel!
	@IBOutlet weak var backgroundCardView: UIView!
	@IBOutlet weak var objectSubtitleLabel: UILabel!

	@IBOutlet weak var objectTagLabel: UILabel!
	//TODO: Create enum to check for card type

	var finacialType : Int?

	func updateWithCardType(card: Card){

		editButton.titleLabel?.font = UIFont.fontAwesomeOfSize(15)
		editButton.setTitle(String.fontAwesomeIconWithName(.Pencil), forState: .Normal)
		editButton.tintColor = UIColor.bundleDarkGrayColor()
		objectTitleLabel.text = card.cardType ?? "Credit Card"
		if let number = card.maskedNumber{
			objectSubtitleLabel.text = "**** **** **** \(number)"
		} else {
			objectSubtitleLabel.text = "**** **** **** ****"
		}
		objectIconImageView.image = card.icon
		finacialType = card.financialType
		if card.isPaymentDefault == true{
			objectTagLabel.text = "Default"
		}
		updateUI()
	}

	func updateWithBankType(bank: BankAccount){

		editButton.titleLabel?.font = UIFont.fontAwesomeOfSize(15)
		editButton.setTitle(String.fontAwesomeIconWithName(.Pencil), forState: .Normal)
		editButton.tintColor = UIColor.bundleDarkGrayColor()
		objectTitleLabel.text = bank.service
		objectSubtitleLabel.text = bank.updatedAt
		objectIconImageView.image = bank.icon
		updateUI()

	}

	func updateUI(){

		backgroundCardView.layer.cornerRadius = 5.0
		backgroundCardView.layer.masksToBounds = false
		backgroundCardView.layer.borderWidth = 5.0
		backgroundCardView.layer.borderColor = UIColor.clearColor().CGColor
		backgroundCardView.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
		backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
		backgroundCardView.layer.shadowOpacity = 1.5
	}
	
}