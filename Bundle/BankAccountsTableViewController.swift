//
//  BankAccountsTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/29/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class BankAccountsTableViewController: UITableViewController {


	@IBOutlet weak var backButton: UIBarButtonItem!

	@IBOutlet weak var addBankAccountButton: UIBarButtonItem!

	var bankAccountArray = [BankAccount]()


	override func viewDidLoad() {
		super.viewDidLoad()

		UserController.fetchUserBankAccounts { (success, bankAccounts) in
			if success {

				self.bankAccountArray.append(bankAccounts!)
				self.tableView.reloadData()
			}
		}

		self.title = "Bank Accounts"
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
		tableView.registerNib(UINib(nibName: "AccountObjectCell", bundle: nil), forCellReuseIdentifier: "accountObjectCell")
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
		addBankAccountButton.setTitleTextAttributes(attributes, forState: .Normal)
		addBankAccountButton.title = String.fontAwesomeIconWithName(.Plus)
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0
		tableView.estimatedRowHeight = 172.0
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return bankAccountArray.count
	}


	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("accountObjectCell", forIndexPath: indexPath) as! AccountObjectCell
		let bankAccount = bankAccountArray[indexPath.row]
		cell.updateWithBankType(bankAccount)
		return cell
	}

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}

	override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		cell.alpha = 0
		UIView.animateWithDuration(0.5) {
			cell.alpha = 1
		}
	}

	override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		cell.alpha = 1
		UIView.animateWithDuration(0.5) {
			cell.alpha = 0
		}
	}



	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isBankHeader()
		let header = headerCell.contentView
		return header
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("toEditBankAccountTableViewController", sender: nil)

	}
	@IBAction func addBankAccountButtonPressed(sender: AnyObject) {

		performSegueWithIdentifier("toCreateBankAccountTableViewController", sender: nil)
	}

	@IBAction func backButtonPressed(sender: AnyObject) {

		self.performSegueWithIdentifier("toAccountTableViewController", sender: nil)
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		if let identifier = segue.identifier{

			switch identifier {
			case "toEditBankAccountTableViewController":
				let editBankAccountTableVC =  segue.destinationViewController as! EditBankAccountTableViewController
				let indexPath = tableView.indexPathForSelectedRow
				let bankAccount = bankAccountArray[indexPath!.row]
				editBankAccountTableVC.currentBankAccount = bankAccount
			default:
				break
			}
		}
	}
	
}
