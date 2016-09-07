//
//  CreateBundleTableViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 8/17/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment
import GoogleMaps
import XMSegmentedControl
import CurrencyTextField

class CreateBundleTableViewController: UITableViewController{

	@IBOutlet weak var createButton: UIButton!
	
	@IBOutlet weak var priceTypeSegmentedControllerView: UIView!

	@IBOutlet weak var guestsLabel: UILabel!
	@IBOutlet weak var bundleTitleTextField: UITextField!

	@IBOutlet weak var rsvpDateLabel: UILabel!
	@IBOutlet weak var startDateLabel: UILabel!
	@IBOutlet weak var endDateLabel: UILabel!

	@IBOutlet weak var priceTypeLabel: UILabel!

	@IBOutlet weak var startTimeLabel: UILabel!
	@IBOutlet weak var endTimeLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	var selectedLocation : GMSPlace?
	var priceType = "EqualSplit"

	@IBOutlet weak var priceTextField: CurrencyTextField!

	@IBOutlet weak var menuButton: UIBarButtonItem!
 override func viewDidLoad() {
	super.viewDidLoad()
	createButton.layer.bundleButtonLayerFillAttributes()
	self.reactiveKeyboard()
	self.title = "Create Bundle"
	menuButton.target = self.revealViewController()
	menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
	let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
	menuButton.setTitleTextAttributes(attributes, forState: .Normal)
	menuButton.title = String.fontAwesomeIconWithName(.Navicon)
	tableView.keyboardDismissMode = .OnDrag
	self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
	let frame = CGRectMake(0, 0, self.view.frame.width, priceTypeSegmentedControllerView.frame.height)
	let segmentedControl3 = XMSegmentedControl(frame: frame, segmentTitle: ["Per Person","Total"], selectedItemHighlightStyle: XMSelectedItemHighlightStyle.Background)
	segmentedControl3.font = UIFont.bundleFontBold(17)!
	segmentedControl3.backgroundColor = UIColor.bundleDarkGrayColor()
	segmentedControl3.tint = UIColor.whiteColor()
	segmentedControl3.highlightTint = UIColor.whiteColor()
	segmentedControl3.delegate = self
	self.priceTypeSegmentedControllerView.addSubview(segmentedControl3)

	if let location = selectedLocation {
		locationLabel.text = location.formattedAddress
	}
	tableView.separatorStyle = .None
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}


	@IBAction func rsvpDateButtonPressed(sender: AnyObject) {
		let calendarPopUp = UIStoryboard(name: "CalendarPopUp", bundle: nil).instantiateViewControllerWithIdentifier("calendarPopUp") as! CalendarPopUpViewController
		calendarPopUp.labelToChange = rsvpDateLabel
		calendarPopUp.delegate = self
		self.dismissKeyboard()
		self.addChildViewController(calendarPopUp)
		calendarPopUp.view.frame = tableView.layer.visibleRect
		self.view.addSubview(calendarPopUp.view)
		calendarPopUp.didMoveToParentViewController(self)
	}

	@IBAction func startDateButtonPressed(sender: AnyObject) {
		let calendarPopUp = UIStoryboard(name: "CalendarPopUp", bundle: nil).instantiateViewControllerWithIdentifier("calendarPopUp") as! CalendarPopUpViewController
		calendarPopUp.labelToChange = startDateLabel
		calendarPopUp.delegate = self
		self.dismissKeyboard()
		self.addChildViewController(calendarPopUp)
		calendarPopUp.view.frame = tableView.layer.visibleRect
		self.view.addSubview(calendarPopUp.view)
		calendarPopUp.didMoveToParentViewController(self)
	}

	@IBAction func endDateButtonPressed(sender: AnyObject) {
		let calendarPopUp = UIStoryboard(name: "CalendarPopUp", bundle: nil).instantiateViewControllerWithIdentifier("calendarPopUp") as! CalendarPopUpViewController
		calendarPopUp.labelToChange = endDateLabel
		calendarPopUp.delegate = self
		self.dismissKeyboard()
		self.addChildViewController(calendarPopUp)
		calendarPopUp.view.frame = tableView.layer.visibleRect
		self.view.addSubview(calendarPopUp.view)
		calendarPopUp.didMoveToParentViewController(self)
	}

	@IBAction func startTimeButtonPressed(sender: AnyObject) {

		let timePopUp = UIStoryboard(name: "TimePopUp", bundle: nil).instantiateViewControllerWithIdentifier("timePopUp") as! TimePopUpViewController
		timePopUp.delegate = self
		timePopUp.labelToChange = startTimeLabel
		self.dismissKeyboard()
		self.addChildViewController(timePopUp)
		timePopUp.view.frame = tableView.layer.visibleRect
		
		self.view.addSubview(timePopUp.view)
	}
	@IBAction func endTimeButtonPressed(sender: AnyObject) {

		let timePopUp = UIStoryboard(name: "TimePopUp", bundle: nil).instantiateViewControllerWithIdentifier("timePopUp") as! TimePopUpViewController
		timePopUp.delegate = self
		timePopUp.labelToChange = endTimeLabel
		self.dismissKeyboard()
		self.addChildViewController(timePopUp)
		timePopUp.view.frame = tableView.layer.visibleRect
		self.view.addSubview(timePopUp.view)
	}
	@IBAction func locationButtonPressed(sender: AnyObject) {
		self.performSegueWithIdentifier("toMapViewController", sender: nil)
	}
	@IBAction func addGuestsButtonPressed(sender: AnyObject) {
		self.performSegueWithIdentifier("toContactsTableViewController", sender: nil)
	}


	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let identifier = segue.identifier{
			switch identifier {
			case "toContactsTableViewController":
				let contactsTableViewController = segue.destinationViewController as! ContactsTableViewController
				contactsTableViewController.delegate = self
				contactsTableViewController.guestsLabel = self.guestsLabel
			default:
				break
			}
		}
	}

	@IBAction func createButtonPressed(sender: AnyObject) {
	}

}

extension CreateBundleTableViewController: XMSegmentedControlDelegate{

	func xmSegmentedControl(xmSegmentedControl: XMSegmentedControl, selectedSegment: Int) {
		switch selectedSegment {
		case 0:
			priceTypeLabel.text = "Per Person"
			priceType = "EqualSplit"
		case 1:
			priceTypeLabel.text = "Total"
			priceType = "Fixed"
		default:
			break
		}
	}
}



extension CreateBundleTableViewController: ContactsDelegate{

	func selectedContacts(label: UILabel?, contacts: [String]) {
		label?.text = "\(contacts.count)"
	}
}

extension CreateBundleTableViewController: CalendarPopUpDelegate {

	func CalendarViewPopulateLabelWithDate(label: UILabel, date: String) {
		label.text = date
	}
}

extension CreateBundleTableViewController: TimePopUpDelegate {

	func TimeViewPopulateLabelWithTime(label: UILabel, time: String) {
		label.text = time
	}
}
