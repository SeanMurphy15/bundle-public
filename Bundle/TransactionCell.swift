//
//  TransactionCell.swift
//  Bundle
//
//  Created by Sean Murphy on 4/20/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView! {
		didSet {
			profileImageView.createCircularImageWithWhiteBorder()
		}
	}

	@IBOutlet weak var statusLabel: UILabel!

	@IBOutlet weak var paymentReceiverProfileImageView: UIImageView! {
		didSet {

			paymentReceiverProfileImageView.createCircularImageWithWhiteBorder()
		}
	}
	@IBOutlet weak var backgroundCardView: UIView!
	@IBOutlet weak var staticStatusLabel: UILabel!
	
	@IBOutlet weak var staticReceivedLabel: UILabel!
	@IBOutlet weak var staticPaidLabel: UILabel!
	@IBOutlet weak var transactionCellHeaderView: UIView!
	@IBOutlet weak var transactionDataView: UIView!
	@IBOutlet weak var transactionDescriptionTextView: UITextView!

	@IBOutlet weak var transactionStatusLabel: UILabel!

	@IBOutlet weak var receivingUserUsernameLabel: UILabel!
	@IBOutlet weak var payingUserUsernameLabel: UILabel!
	@IBOutlet weak var bundleNameLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!


	@IBOutlet weak var amountLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

	func updateWithTransaction(transaction: Transaction, headerColor: UIColor, dataViewColor: UIColor){

		if let trans = transaction.amount?.description{
		amountLabel.text = "$\(trans)"
		}
		if transaction.success == true{
			transactionStatusLabel.text = "Complete"
		}else {
			transactionStatusLabel.text = "Incomplete"

		}
		bundleNameLabel.text = transaction.bundleEventName
		dateLabel.text = transaction.createdAt
		payingUserUsernameLabel.text = transaction.senderEmail
		receivingUserUsernameLabel.text = transaction.receiverEmail
		statusLabel.text = transaction.status
		transactionDescriptionTextView.text = transaction.transactionDescription
		transactionCellHeaderView.backgroundColor = headerColor
		transactionDataView.backgroundColor = dataViewColor
		updateUI()

	}

	func updateUI(){

		selectionStyle = .None
		backgroundCardView.backgroundColor = UIColor.whiteColor()
		backgroundCardView.layer.cornerRadius = 5.0
		backgroundCardView.layer.masksToBounds = false
		backgroundCardView.layer.borderWidth = 10.0
		backgroundCardView.layer.borderColor = UIColor.clearColor().CGColor
		backgroundCardView.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.5).CGColor
		backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
		backgroundCardView.layer.shadowOpacity = 1.5
		transactionCellHeaderView.layer.cornerRadius = 5.0
	}
	
}
