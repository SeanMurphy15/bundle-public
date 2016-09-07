//
//  CreateBankAccountTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/30/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class CreateBankAccountTableViewController: UITableViewController {

	@IBOutlet weak var bankAccountTypeSwitch: UISwitch!
	@IBOutlet weak var backButton: UIBarButtonItem!

	@IBOutlet weak var deleteBankAccountButton: UIBarButtonItem!

	@IBOutlet weak var createBankAccountButton: UIButton!
	@IBOutlet weak var bankAccountTaxIdentifierTextField: UITextField!
	@IBOutlet weak var bankAccountCountryTextField: UITextField!
	@IBOutlet weak var bankAccountRoutingNumberTextField: UITextField!
	@IBOutlet weak var bankAccountNumberTextField: UITextField!
	@IBOutlet weak var bankAccountHolderNameTextField: UITextField!
	@IBOutlet weak var bankAccountIconImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		bankAccountTaxIdentifierTextField.layer.bundleTextFieldLayerAttributes()
		bankAccountCountryTextField.layer.bundleTextFieldLayerAttributes()
		bankAccountRoutingNumberTextField.layer.bundleTextFieldLayerAttributes()
		bankAccountNumberTextField.layer.bundleTextFieldLayerAttributes()
		bankAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()
		createBankAccountButton.layer.bundleButtonLayerFillAttributes()


		self.title = "Add Bank Account"
		self.reactiveKeyboard()
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		deleteBankAccountButton.setTitleTextAttributes(attributes, forState: .Normal)
		deleteBankAccountButton.title = String.fontAwesomeIconWithName(.Trash)
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isBankHeader()
		let header = headerCell.contentView
		return header
	}



	@IBAction func createBankAccountButtonPressed(sender: AnyObject) {


	}

	@IBAction func bankAccountTypeSwitchChanged(sender: AnyObject) {
	}

	@IBAction func backButtonPressed(sender: AnyObject) {

		navigationController?.popViewControllerAnimated(true)
	}

}
