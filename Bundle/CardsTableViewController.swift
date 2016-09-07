//
//  CardsTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/29/16.
//  Copyright © 2016 Bundle. All rights reserved.
//


import UIKit

class CardsTableViewController: UITableViewController {

	var cardArray = [Card]()

	@IBOutlet weak var backButton: UIBarButtonItem!

	@IBOutlet weak var addCardButton: UIBarButtonItem!
	override func viewDidLoad() {
		super.viewDidLoad()

		UserController.fetchUserCards { (success, cards) in
			if success {

				self.cardArray.append(cards!)
				self.tableView.reloadData()
			}
		}
		self.title = "My Cards"
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
		tableView.registerNib(UINib(nibName: "AccountObjectCell", bundle: nil), forCellReuseIdentifier: "accountObjectCell")
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0
		tableView.estimatedRowHeight = 55.0

		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
		addCardButton.setTitleTextAttributes(attributes, forState: .Normal)
		addCardButton.title = String.fontAwesomeIconWithName(.Plus)
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
		return cardArray.count
	}


	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("accountObjectCell", forIndexPath: indexPath) as! AccountObjectCell
		let card = cardArray[indexPath.row]
		cell.updateWithCardType(card)
		return cell
	}

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}

	@IBAction func addCardButtonPressed(sender: AnyObject) {
		let nav = storyboard?.instantiateViewControllerWithIdentifier("createCardTableViewController") as! UINavigationController
		let vc = nav.topViewController as! CreateCardTableViewController
		self.navigationController?.pushViewController(vc, animated: true)
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


	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		let cell = tableView.cellForRowAtIndexPath(indexPath) as! AccountObjectCell
		if cell.finacialType == 0{
			performSegueWithIdentifier("toEditCreditCardTableViewController", sender: nil)
		} else {
			performSegueWithIdentifier("toEditDebitCardTableViewController", sender: nil)
		}

	}
	@IBAction func backButtonPressed(sender: AnyObject) {

		self.performSegueWithIdentifier("toAccountTableViewController", sender: nil)
	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isCardHeader()
		let header = headerCell.contentView
		return header
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let identifier = segue.identifier{

			switch identifier {
			case "toEditCreditCardTableViewController":
				let indexPath = tableView.indexPathForSelectedRow
				let card = cardArray[indexPath!.row]
				let editCreditCardTableViewController = segue.destinationViewController as! EditCreditCardTableViewController
				editCreditCardTableViewController.currentCreditCard = card
				break
			case "toEditDebitCardTableViewController":
				let indexPath = tableView.indexPathForSelectedRow
				let card = cardArray[indexPath!.row]
				let editDebitCardTableViewController = segue.destinationViewController as! EditDebitCardTableViewController
				editDebitCardTableViewController.currentDebitCard = card
				break
			case "toCreateCardTableViewController":

				break
			default:
				break
			}
		}
	}
	
}
