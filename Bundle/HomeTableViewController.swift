//
//  HomeVC.swift
//  Bundle
//
//  Created by Sean Murphy on 4/11/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

@IBDesignable
class HomeTableViewController: UITableViewController {


	@IBOutlet weak var notificationsButton: UIBarButtonItem!

	@IBOutlet weak var menuButton: UIBarButtonItem!
	var bundleArray = [Bundle]()


	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerNib(UINib(nibName: "BundleCell", bundle: nil), forCellReuseIdentifier: "bundleCell")
		tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")


		self.placeLogoInNavigationBar()
		menuButton.target = self.revealViewController()
		menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		menuButton.setTitleTextAttributes(attributes, forState: .Normal)
		menuButton.title = String.fontAwesomeIconWithName(.Navicon)
		notificationsButton.setTitleTextAttributes(attributes, forState: .Normal)
		notificationsButton.title = String.fontAwesomeIconWithName(.Bell)
		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
		tableView.estimatedSectionHeaderHeight = 129.0
		tableView.estimatedRowHeight = 172.0


		tableView.separatorStyle = .None
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		BundleController.fetchUserBundles { (success, bundles) in
			if success {
				if let bundles = bundles {
					self.bundleArray = bundles
					self.tableView.reloadData()
				}
			}
		}
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}



	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}


	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
		headerCell.isProfileHeader()
		let header = headerCell.contentView
		return header
	}


	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return bundleArray.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCellWithIdentifier("bundleCell") as! BundleCell
		let bundle = bundleArray[indexPath.row]
		if let price = ConversionController.convertIntToString(bundle.price!){
			if let priceType = bundle.bundleEventPriceStructureType {
				cell.bundlePrice.text = "$\(price) \(priceType)"
			}
		}
		cell.bundleEventNameLabel.text = bundle.bundleEventName
		cell.bundleDescriptionTextView.text = bundle.description
		cell.selectionStyle = .None
		cell.updateUI()

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

	@IBAction func notificationsButtonPressed(sender: AnyObject) {



		let notificationsVC = UIStoryboard(name: "Notifications", bundle: nil).instantiateViewControllerWithIdentifier("notificationsTableViewController") as! UINavigationController

		self.presentViewController(notificationsVC, animated: true, completion: nil)
		
	}

}
