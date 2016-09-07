//
//  CreateCardTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 9/1/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import XMSegmentedControl

class CreateCardTableViewController: UITableViewController {

	@IBOutlet weak var paymentDefaultSwitch: UISwitch!
	@IBOutlet weak var collectionDefaultSwitch: UISwitch!

	@IBOutlet weak var backButton: UIBarButtonItem!

	@IBOutlet weak var cvcTextField: UITextField!
	@IBOutlet weak var createCardButton: UIButton!
	@IBOutlet weak var cardExpirationTextField: UITextField!

	@IBOutlet weak var cardNumberTextField: UITextField!
	@IBOutlet weak var cardAccountHolderNameTextField: UITextField!
	var paymentDefaultChoice = false
	var collectionDefaultChoice = false
	@IBOutlet weak var countryTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()

		cardExpirationTextField.layer.bundleTextFieldLayerAttributes()
		cvcTextField.layer.bundleTextFieldLayerAttributes()
		countryTextField.layer.bundleTextFieldLayerAttributes()

		cardNumberTextField.layer.bundleTextFieldLayerAttributes()
		cardAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()
		cardAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()


		createCardButton.layer.bundleButtonLayerFillAttributes()

		self.title = "Add Card"
		self.reactiveKeyboard()
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0


	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isCardHeader()
		let header = headerCell.contentView
		return header
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()

	}
	
	@IBAction func collectionDefaultSwitchChanged(sender: AnyObject) {
	}
	@IBAction func paymentDefaultSwitchChanged(sender: AnyObject) {
	}


	@IBAction func createCardButtonPressed(sender: AnyObject) {


	}

	@IBAction func backButtonPressed(sender: AnyObject) {

		self.navigationController?.popViewControllerAnimated(true)
	}


}

