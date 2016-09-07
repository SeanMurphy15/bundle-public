//
//  ContactsTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/19/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import XMSegmentedControl


protocol ContactsDelegate {
	func selectedContacts(label: UILabel?, contacts: [String])
}

class ContactsTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchResultsUpdating {

	@IBOutlet weak var doneButton: UIBarButtonItem!

	@IBOutlet weak var backButton: UIBarButtonItem!


	@IBOutlet weak var tableView: UITableView!

	var delegate : ContactsDelegate?
	var guestsLabel : UILabel?
	var selectedSegmentIndex = 0

	static let sharedInstance = ContactsTableViewController()
	var allContacts = ["Gio","Misha","Zhen","Chris","Jake","Sean","Friend 1","Friend 2","Friend 3","Friend 4","Friend 5","Friend 6","Friend 7","Friend 8","group 1","group 2","group 3","group 4","group 5","group 6","group 7","group 8"]
	var myFriends = ["Friend 1","Friend 2","Friend 3","Friend 4","Friend 5","Friend 6","Friend 7","Friend 8"]
	var myGroups = ["group 1","group 2","group 3","group 4","group 5","group 6","group 7","group 8"]

	var searchController : UISearchController!


	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Add Contacts"
		tableView.registerNib(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "contactCell")
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		backButton.setTitleTextAttributes(attributes, forState: .Normal)
		backButton.title = String.fontAwesomeIconWithName(.ChevronLeft)
		updateUI()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func updateSearchResultsForSearchController(searchController: UISearchController) {

		let searchTerm = searchController.searchBar.text!.lowercaseString
		let contactsSearchResultsTableVC = searchController.searchResultsController as! ContactsSearchResultsTableViewController
		switch selectedSegmentIndex {
		case 0:
			contactsSearchResultsTableVC.filteredSearchResults = allContacts.filter({ $0.lowercaseString.containsString(searchTerm) })
			break
		case 1:
			contactsSearchResultsTableVC.filteredSearchResults = myFriends.filter({ $0.lowercaseString.containsString(searchTerm) })
			break
		case 2:
			contactsSearchResultsTableVC.filteredSearchResults = myGroups.filter({ $0.lowercaseString.containsString(searchTerm) })
			break
		default:
			break
		}
		contactsSearchResultsTableVC.tableView.reloadData()

	}


	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		var returnValue = 0

		switch selectedSegmentIndex {
		case 0:
			returnValue = allContacts.count
			break
		case 1:
			returnValue = myFriends.count
			break
		case 2:
			returnValue = myGroups.count
			break
		default:
			break
		}

		return returnValue
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactCell
		if indexPath.row % 2 == 0{
			cell.backgroundCardView.backgroundColor = UIColor.whiteColor()
		} else {
			cell.backgroundCardView.backgroundColor = UIColor.bundleLightGrayColor()
		}
		switch selectedSegmentIndex {

		case 0:
			cell.contactNameLabel?.text = allContacts[indexPath.row]

			cell.selectionIconImageView.hidden = true

			for name in LocalDataController.sharedInstance.selectedCells {

				if name == cell.contactNameLabel.text{

					cell.selectionIconImageView.hidden = false
				}
			}
			break

		case 1:
			cell.contactNameLabel?.text = myFriends[indexPath.row]

			cell.selectionIconImageView.hidden = true

			for name in LocalDataController.sharedInstance.selectedCells {

				if name == cell.contactNameLabel.text{

					cell.selectionIconImageView.hidden = false
				}
			}
			break

		case 2:
			cell.contactNameLabel?.text = myGroups[indexPath.row]

			cell.selectionIconImageView.hidden = true

			for name in LocalDataController.sharedInstance.selectedCells {

				if name == cell.contactNameLabel.text{

					cell.selectionIconImageView.hidden = false
				}
			}
			break

		default:

			break
		}

		cell.updateUI()
		cell.selectionStyle = .None
		return cell

	}


	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


		let cell = tableView.cellForRowAtIndexPath(indexPath) as! ContactCell

		if LocalDataController.sharedInstance.selectedCells.contains(cell.contactNameLabel.text!) == true{

			cell.selectionIconImageView.hidden = true

			if let index = LocalDataController.sharedInstance.selectedCells.indexOf(cell.contactNameLabel.text!) {

				LocalDataController.sharedInstance.selectedCells.removeAtIndex(index)
				print(LocalDataController.sharedInstance.selectedCells)

			}

		} else {

			LocalDataController.sharedInstance.selectedCells.append(cell.contactNameLabel.text!)
			print(LocalDataController.sharedInstance.selectedCells)

			cell.selectionIconImageView.hidden = false
		}

	}


	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {

	}



	@IBAction func backButtonPressed(sender: AnyObject) {

		navigationController?.popViewControllerAnimated(true)
	}

	@IBAction func doneButtonPressed(sender: UIBarButtonItem) {
		navigationController?.popViewControllerAnimated(true)
		delegate?.selectedContacts(guestsLabel,contacts: LocalDataController.sharedInstance.selectedCells)
	}

	func updateUI(){

		tableView.separatorStyle = .None

		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())


		let resultsViewController = UIStoryboard(name: "CreateBundle", bundle: nil).instantiateViewControllerWithIdentifier("contactsSearchResults")


		searchController = UISearchController(searchResultsController: resultsViewController)
		searchController.searchResultsUpdater = self
		searchController.searchBar.sizeToFit()
		tableView.tableHeaderView = searchController.searchBar
		searchController.searchBar.barTintColor = UIColor.whiteColor()
		searchController.searchBar.placeholder = "Search All"
		searchController.searchBar.barStyle = .Default
		searchController.searchBar.layer.borderColor = UIColor.clearColor().CGColor
		searchController.hidesNavigationBarDuringPresentation = true
		definesPresentationContext = true
	}

}

extension ContactsTableViewController: XMSegmentedControlDelegate{

	func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
		self.selectedSegmentIndex = selectedSegment
		tableView.reloadData()
	}
}
