//
//  ContactsSearchResultsTableVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/14/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import XMSegmentedControl

class ContactsSearchResultsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

	var filteredSearchResults: [String] = []

	@IBOutlet weak var tableView: UITableView!


	var selectedSegmentIndex = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerNib(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "contactCell")
		tableView.separatorStyle = .None
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return filteredSearchResults.count
	}


	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactCell
		cell.selectionStyle = .None
		cell.updateUI()
		cell.contactNameLabel?.text = filteredSearchResults[indexPath.row]

		cell.selectionIconImageView.hidden = true

		for name in LocalDataController.sharedInstance.selectedCells {

			if name == cell.contactNameLabel.text{

				cell.selectionIconImageView.hidden = false
			}
		}

		return cell

	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


		let cell = tableView.cellForRowAtIndexPath(indexPath) as! ContactCell

		if LocalDataController.sharedInstance.selectedCells.contains(cell.contactNameLabel.text!) == true{

			cell.selectionIconImageView.hidden = true

			if let index = LocalDataController.sharedInstance.selectedCells.indexOf(cell.contactNameLabel.text!) {

				LocalDataController.sharedInstance.selectedCells.removeAtIndex(index)

			}

		} else {

			LocalDataController.sharedInstance.selectedCells.append(cell.contactNameLabel.text!)

			cell.selectionIconImageView.hidden = false
		}


	}


	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {


		let contactsVC = segue.destinationViewController as! ContactsTableViewController


		_ = contactsVC.view

		
		contactsVC.tableView.reloadData()


	}

}

