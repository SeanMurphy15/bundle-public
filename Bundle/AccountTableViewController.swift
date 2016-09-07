//
//  AccountVCViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/21/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class AccountTableViewController: UITableViewController{
	@IBOutlet weak var dropdownButton: UIButton!

	@IBOutlet weak var logoutButton: UIButton!
	@IBOutlet weak var cardIconImageView: UIImageView!
	@IBOutlet weak var bankIconImageView: UIImageView!
	@IBOutlet weak var profileIconImageView: UIImageView!
	@IBOutlet weak var settingsIconImageView: UIImageView!
	@IBOutlet weak var privacyPolicyIconImageView: UIImageView!
	@IBOutlet weak var termsOfServiceIconImageView: UIImageView!

	@IBOutlet weak var menuButton: UIBarButtonItem!

	var dropdownSelected = false

	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "My Account"
		menuButton.target = self.revealViewController()
		menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		menuButton.setTitleTextAttributes(attributes, forState: .Normal)
		menuButton.title = String.fontAwesomeIconWithName(.Navicon)
		dropdownButton.titleLabel?.font = UIFont.fontAwesomeOfSize(20)
		dropdownButton.setTitle(String.fontAwesomeIconWithName(.ChevronDown), forState: .Normal)
		profileIconImageView.image = UIImage.fontAwesomeIconWithName(.User, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		settingsIconImageView.image = UIImage.fontAwesomeIconWithName(.Gear, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		cardIconImageView.image = UIImage.fontAwesomeIconWithName(.CreditCard, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		bankIconImageView.image = UIImage.fontAwesomeIconWithName(.Bank, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		privacyPolicyIconImageView.image = UIImage.fontAwesomeIconWithName(.Eye, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		termsOfServiceIconImageView.image = UIImage.fontAwesomeIconWithName(.Info, textColor: UIColor.bundleDarkGrayColor(), size: CGSizeMake(30, 30))
		logoutButton.layer.bundleButtonLayerFillAttributes()
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isProfileHeader()
		let header = headerCell.contentView
		return header
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 9
	}


	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		switch indexPath.row {
		case 0:
			if dropdownSelected == true {
					return 200
			} else {
				return 20
			}
			case 1...9:
				return 50
		default:
			break
		}
		return UITableViewAutomaticDimension
	}



	@IBAction func dropdownButtonPressed(sender: AnyObject) {

		if dropdownSelected == true {
			dropdownSelected = false
			UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 3.0, initialSpringVelocity: 2.0, options: .CurveEaseOut, animations: {
				self.dropdownButton.transform = CGAffineTransformMakeScale(1, 1)

				}, completion: nil)
		} else {
			dropdownSelected = true
			UIView.animateWithDuration(0.5, delay: 0.1, usingSpringWithDamping: 3.0, initialSpringVelocity: 2.0, options: .CurveEaseOut, animations: {
				self.dropdownButton.transform = CGAffineTransformMakeScale(1, -1)

				}, completion: nil)
		}
		self.tableView.beginUpdates()
		self.tableView.endUpdates()

	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		if let identifier = segue.identifier{

			switch identifier {
			case "toBankAccountsTableViewController":
				let navigation = segue.destinationViewController as! UINavigationController
				let editDebitCardTableVC = navigation.topViewController as! BankAccountsTableViewController
				break
			case "toCardsTableViewController":
				let navigation = segue.destinationViewController as! UINavigationController
				let editCreditCardTableVC = navigation.topViewController as! CardsTableViewController
//				let indexPath = tableView.indexPathForSelectedRow
//				let creditCard = creditCardArray[indexPath!.row]
//				editCreditCardTableVC.currentCreditCard = creditCard
			case "toEditBankAccountTableVC":
//				let navigation = segue.destinationViewController as! UINavigationController
//				let editBankAccountTableVC = navigation.topViewController as! EditBankAccountTableViewController
//				let indexPath = tableView.indexPathForSelectedRow
//				let bankAccount = bankAccountArray[indexPath!.row]
//				editBankAccountTableVC.currentBankAccount = bankAccount
				break
			default:
				break
			}
		}
	}

	@IBAction func profileButtonPressed(sender: AnyObject) {
	}
	@IBAction func BankAccountButtonPressed(sender: AnyObject) {

		performSegueWithIdentifier("toBankAccountsTableViewController", sender: nil)
	}

	@IBAction func cardButtonPressed(sender: AnyObject) {
		performSegueWithIdentifier("toCardsTableViewController", sender: nil)
	}


	@IBAction func settingsButtonPressed(sender: AnyObject) {
	}


	@IBAction func termsOfServiceButtonPressed(sender: AnyObject) {
	}

	@IBAction func privacyPolicyButtonPressed(sender: AnyObject) {
	}

	@IBAction func logoutButtonPressed(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
}
