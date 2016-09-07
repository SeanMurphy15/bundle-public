//
//  EditBankAccountTableVC.swift
//  Bundle
//
//  Created by Sean Murphy on 5/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class EditBankAccountTableViewController: UITableViewController {
	@IBOutlet weak var accountNumberIcon: UIImageView!
	@IBOutlet weak var accountHolderIcon: UIImageView!

	@IBOutlet weak var countryIcon: UIImageView!
	@IBOutlet weak var taxIdIcon: UIImageView!
	@IBOutlet weak var routingNumberIcon: UIImageView!
	@IBOutlet weak var backButton: UIBarButtonItem!

	@IBOutlet weak var deleteBankAccountButton: UIBarButtonItem!
    
    @IBOutlet weak var updateBankAccountButton: UIButton!
    @IBOutlet weak var bankAccountTaxIdentifierTextField: UITextField!
    @IBOutlet weak var bankAccountCountryTextField: UITextField!
    @IBOutlet weak var bankAccountRoutingNumberTextField: UITextField!
    @IBOutlet weak var bankAccountNumberTextField: UITextField!
    @IBOutlet weak var bankAccountHolderNameTextField: UITextField!
   
    var currentBankAccount : BankAccount?

    override func viewDidLoad() {
        super.viewDidLoad()



			bankAccountTaxIdentifierTextField.layer.bundleTextFieldLayerAttributes()
			bankAccountCountryTextField.layer.bundleTextFieldLayerAttributes()
			bankAccountRoutingNumberTextField.layer.bundleTextFieldLayerAttributes()
			bankAccountNumberTextField.layer.bundleTextFieldLayerAttributes()
			bankAccountHolderNameTextField.layer.bundleTextFieldLayerAttributes()
			updateBankAccountButton.layer.bundleButtonLayerFillAttributes()
			

			self.title = "Edit Bank Account"
			self.reactiveKeyboard()
			let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
			deleteBankAccountButton.setTitleTextAttributes(attributes, forState: .Normal)
			deleteBankAccountButton.title = String.fontAwesomeIconWithName(.Trash)
			backButton.setTitleTextAttributes(attributes, forState: .Normal)
			backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
			tableView.registerNib(UINib(nibName: "ObjectDetailHeaderCell", bundle: nil), forCellReuseIdentifier: "objectDetailHeaderCell")
			tableView.sectionHeaderHeight = UITableViewAutomaticDimension
			tableView.estimatedSectionHeaderHeight = 129.0
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("objectDetailHeaderCell") as! ObjectDetailHeaderCell
		headerCell.isBankAccountTypeHeader(currentBankAccount!)
		let header = headerCell.contentView
		return header
	}



    @IBAction func updateBankAccountButtonPressed(sender: AnyObject) {


	}

    
    @IBAction func backButtonPressed(sender: AnyObject) {

        navigationController?.popViewControllerAnimated(true)
    }
}
