//
//  TransactionsTableVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/20/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UITableViewController {

	var selectedRows: [NSIndexPath] = []
	var transactionArray : [Transaction] = []

	@IBOutlet weak var menuButton: UIBarButtonItem!

	@IBOutlet weak var filterButton: UIBarButtonItem!
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "My Transactions"
		menuButton.target = self.revealViewController()
		menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		menuButton.setTitleTextAttributes(attributes, forState: .Normal)
		menuButton.title = String.fontAwesomeIconWithName(.Navicon)
		filterButton.setTitleTextAttributes(attributes, forState: .Normal)
		filterButton.title = String.fontAwesomeIconWithName(.Sliders)

		tableView.registerNib(UINib(nibName: "TransactionCell", bundle: nil), forCellReuseIdentifier: "transactionCell")
		tableView.separatorStyle = .None
		tableView.estimatedRowHeight = 170.0
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

		UserController.fetchUserTransactions { (success, transactions) in
			if success {
				if let transactions = transactions {
					self.transactionArray = transactions
					self.tableView.reloadData()
				}
			}
		}
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
		return transactionArray.count
	}


	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("transactionCell", forIndexPath: indexPath) as! TransactionCell
		let transaction = transactionArray[indexPath.row]
		if indexPath.row % 2 == 0 {
			cell.updateWithTransaction(transaction, headerColor: UIColor.whiteColor(), dataViewColor: UIColor.bundleLightGrayColor())
		} else {
			cell.updateWithTransaction(transaction, headerColor: UIColor.bundleLightGrayColor(), dataViewColor: UIColor.bundleMediumGrayColor())

		}
		return cell
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

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

		if selectedRows.contains(indexPath) {
			return UITableViewAutomaticDimension
		} else {
			return 67.0
		}
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! TransactionCell

		if selectedRows.contains(indexPath) {
			if let index = selectedRows.indexOf(indexPath) {
				UIView.animateWithDuration(0.5, animations: {
					cell.transactionDataView.alpha = 0.0
					cell.transactionDescriptionTextView.alpha = 0.0
				})
				selectedRows.removeAtIndex(index)
			}

		} else {
			UIView.animateWithDuration(1.5, animations: {
				cell.transactionDataView.alpha = 1.0
				cell.transactionDescriptionTextView.alpha = 1.0
			})
			selectedRows.append(indexPath)
		}

		self.tableView.beginUpdates()
		self.tableView.endUpdates()

	}
	@IBAction func filterButtonPressed(sender: AnyObject) {
	}
}
