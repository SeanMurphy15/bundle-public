//
//  ProfileHeaderCell.swift
//  Bundle
//
//  Created by Sean Murphy on 8/29/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import Foundation
import UIKit


class HeaderCell: UITableViewCell{


	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var backgroundImageOverlay: UIImageView!

	func isBankHeader(){

		titleLabel.text = "Bank Accounts"
		subtitleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.Bank, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))

	}

	func isCardHeader(){

		titleLabel.text = "Cards"
		subtitleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.CreditCard, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))
	}

	func isSettingsHeader(){

		titleLabel.text = "Settings"
		subtitleLabel.text = ""
		iconImageView.image = UIImage.fontAwesomeIconWithName(.Gear, textColor: UIColor.whiteColor(), size: CGSizeMake(100, 100))
	}


	func isProfileHeader(){

		iconImageView.createCircularImageWithWhiteBorder()
		UserController.fetchCurrentUser { (success, user) in
			if success {
				if let user = user {

					if let firstname = user.firstName{
						if let lastname = user.lastName{

							self.titleLabel.text = "\(firstname) \(lastname)"
							self.subtitleLabel.text = user.email
						}
					}
				}
			}
		}

	}

	func isCardTypeHeader(card: Card){

		titleLabel.text = "********1234"
		subtitleLabel.text = card.cardType
		iconImageView.image = card.icon
		self.contentView.backgroundColor = UIColor.whiteColor()
		backgroundImageOverlay.hidden = true
		titleLabel.textColor = UIColor.bundleDarkGrayColor()
		subtitleLabel.textColor = UIColor.bundleDarkGrayColor()
	}

	func isBankTypeHeader(bank: BankAccount){

		titleLabel.text = "********12345"
		subtitleLabel.text = bank.accountHolderName
		iconImageView.image = bank.icon
	}
}







