//
//  BundleViewController.swift
//  Bundle
//
//  Created by Sean Murphy on 4/8/16.
//  Copyright © 2016 Bundle. All rights reserved.
//

import UIKit

class BundleTableViewController: UITableViewController{

	var bundleArray = [Bundle]()
	var currentUser: User?

	@IBOutlet weak var filterButton: UIBarButtonItem!
	@IBOutlet weak var menuButton: UIBarButtonItem!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.registerNib(UINib(nibName: "BundleCell", bundle: nil), forCellReuseIdentifier: "bundleCell")

//		tableView.sectionHeaderHeight = UITableViewAutomaticDimension
//		tableView.estimatedSectionHeaderHeight = 129.0
		self.title = "My Bundles"
		tableView.estimatedRowHeight = 172.0
		menuButton.target = self.revealViewController()
		menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
		let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
		menuButton.setTitleTextAttributes(attributes, forState: .Normal)
		menuButton.title = String.fontAwesomeIconWithName(.Navicon)
		filterButton.setTitleTextAttributes(attributes, forState: .Normal)
		filterButton.title = String.fontAwesomeIconWithName(.Sliders)

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

		UserController.fetchCurrentUser { (success, user) in

			if success {
				if let user = user {
					self.currentUser = user
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



	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
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
	@IBAction func filterButtonPressed(sender: AnyObject) {
	}
	
}
